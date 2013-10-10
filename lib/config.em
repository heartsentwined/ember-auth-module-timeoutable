Em.Auth.reopen
  timeoutable:
    # [number] (opt) Period (mins) before timing out a signed in session;
    #   default: 20
    period: 20

    # [function] (opt) Method to call for timing out a signed in session;
    #   default: (auth).signOut()
    callback: null
