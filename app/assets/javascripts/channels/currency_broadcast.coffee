App.currency_broadcast = App.cable.subscriptions.create "CurrencyBroadcastChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  send: (currency)->
    @perform 'send', currency
