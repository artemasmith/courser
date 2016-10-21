@Currency = React.createClass
  getInitialState: ->
    currency: @props.currency
  setupSubscription: ->
    App.comments = App.cable.subscriptions.create(
      'CurrencyBroadcastChannel',
      updateCurrency: @updateCurrency
      connected: ->
        setTimeout @perform('follow'), 1000

      received: (data) ->
        @updateCurrency data.currency
      )

  
  updateCurrency: (data)->
    console.log('UPDATEING CuRRENCY')
    @setState(currency: data)
  componentDidMount: ->
    @setupSubscription

  render: ->
    React.DOM.div
      className: 'Currency'
      React.DOM.h2
        className: 'title'
        React.DOM.label null, @state.currency.name + ' ' + @state.currency.value