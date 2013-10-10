// Generated by EmberScript 0.0.7
var get$ = Ember.get;
Em.onLoad('Ember.Application', function (application) {
  return application.initializer({
    name: 'ember-auth.module.timeoutable',
    after: 'ember-auth',
    initialize: function (container, app) {
      return app.register('authModule:timeoutable', get$(get$(Em, 'Auth'), 'TimeoutableAuthModule'));
    }
  });
});// Generated by EmberScript 0.0.7
var get$ = Ember.get;
var set$ = Ember.set;
set$(get$(Em, 'Auth'), 'TimeoutableAuthModule', Ember.Object.extend({
  init: function () {
    var this$;
    null != get$(this, 'config') || set$(this, 'config', get$(get$(this, 'auth'), 'timeoutable'));
    null != get$(get$(this, 'config'), 'callback') || set$(get$(this, 'config'), 'callback', (this$ = this, function () {
      return get$(this$, 'auth').signOut();
    }));
    get$(this, 'auth').addHandler('signInSuccess', get$(this, 'register'));
    get$(this, 'auth').addHandler('signInError', get$(this, 'clear'));
    return get$(this, 'auth').addHandler('signOutSuccess', get$(this, 'clear'));
  },
  _startTime: null,
  timeout: function () {
    var period;
    if (get$(this, '_startTime') === null)
      return;
    period = get$(get$(this, 'config'), 'period') * 60 * 1e3;
    if (get$(this, '_startTime') - new Date < period)
      return;
    return get$(this, 'config').callback();
  },
  register: function () {
    var period, this$;
    set$(this, '_startTime', get$(get$(get$(this, 'auth'), '_session'), 'startTime'));
    period = get$(get$(this, 'config'), 'period') * 60 * 1e3;
    return setTimeout((this$ = this, function () {
      return this$.timeout();
    }), period);
  },
  reset: function () {
    this.register();
    return set$(this, '_startTime', new Date);
  },
  clear: function () {
    return set$(this, '_startTime', null);
  }
}));