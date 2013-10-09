Em.onLoad 'Ember.Application', (application) ->
  application.initializer
    name: 'ember-auth.module.timeoutable'
    after: 'ember-auth'

    initialize: (container, app) ->
      app.register 'authModule:timeoutable', Em.Auth.TimeoutableAuthModule
