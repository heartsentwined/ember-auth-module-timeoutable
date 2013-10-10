# timeoutable module for ember-auth

[![Build Status](https://secure.travis-ci.org/heartsentwined/ember-auth-module-timeoutable.png)](http://travis-ci.org/heartsentwined/ember-auth-module-timeoutable)
[![Gem Version](https://badge.fury.io/rb/ember-auth-module-timeoutable-source.png)](http://badge.fury.io/rb/ember-auth-module-timeoutable-source)
[![NPM version](https://badge.fury.io/js/ember-auth.png)](http://badge.fury.io/js/ember-auth-module-timeoutable)

Timeout a signed in session after a specified period.

## Config

```coffeescript
App.Auth = Em.Auth.extend
  modules: ['timeoutable']

  timeoutable:
    # [number] (opt) Period (mins) before timing out a signed in session;
    #   default: 20
    period: 20

    # [function] (opt) Method to call for timing out a signed in session;
    #   default: (auth).signOut()
    callback: null
```

## Usage

```coffeescript
# Low-level methods for manual use

# reset the timeout period
@auth.get('module.timeoutable').reset()

# register a new timeout (and cancel any previously registered timeout)
@auth.get('module.timeoutable').register()

# cancel any registered timeout
@auth.get('module.timeoutable').clear()
```
