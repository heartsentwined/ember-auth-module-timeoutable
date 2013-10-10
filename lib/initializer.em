Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.timeoutable'
    before: 'ember-auth-load'

    initialize: (container, app) ->
      app.register 'authModule:timeoutable', Em.Auth.TimeoutableAuthModule
      app.inject 'authModule:timeoutable', 'auth', 'auth:main'
