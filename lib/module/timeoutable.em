class Em.Auth.TimeoutableAuthModule
  init: ->
    @auth._config 'timeoutable', @_defaultConfig
    @config?          || (@config = @auth._config 'timeoutable')
    @config.callback? || (@config.callback = => @auth.signOut())

    @auth.addHandler 'signInSuccess',  @register.bind(@)
    @auth.addHandler 'signInError',    @clear.bind(@)
    @auth.addHandler 'signOutSuccess', @clear.bind(@)

  _defaultConfig:
    # [number] (opt) Period (mins) before timing out a signed in session;
    #   default: 20
    period: 20

    # [function] (opt) Method to call for timing out a signed in session;
    #   default: (auth).signOut()
    callback: null

  # @property [Date|null] the start time of the current timeout count
  #   ! might not be same as session start time
  # @private
  _startTime: null

  # timeout the current session by config-ed callback
  timeout: ->
    return if @_startTime == null
    period = @config.period * 60 * 1000 # in ms
    return if @_startTime - new Date() < period
    @config.callback()

  # register a new timeout call
  register: ->
    @_startTime = @auth._session.startTime
    period = @config.period * 60 * 1000 # in ms
    setTimeout (=> @timeout()), period

  # reset the timeout time count
  reset: ->
    @register()
    @_startTime = new Date()

  # clear any pending timeouts
  clear: ->
    @_startTime = null
