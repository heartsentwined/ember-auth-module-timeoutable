Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.timeoutable'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:timeoutable', Em.Auth.TimeoutableAuthModule, \
      { singleton: true }
      app.inject 'authModule:timeoutable', 'auth', 'auth:main'

  application.initializer
    name: 'ember-auth.module.timeoutable-load'
    after: 'ember-auth-load'

    initialize: (container, app) ->
      # force init() call wth an eager-load
      container.lookup 'authModule:timeoutable'
