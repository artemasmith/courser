@Currency = React.createClass
  getInitialState: ->
    currency: @props.currency
  handleSubscription: (new_value)->
    @setState(currency: new_value)
  render: ->
    React.DOM.div
      className: 'Currency'
      React.DOM.h2
        className: 'title'
        React.DOM.label null, @state.currency.name + ' ' + @state.currency.value