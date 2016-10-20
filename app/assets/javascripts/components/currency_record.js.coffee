@CurrencyRecord = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, this.props.currency_record.created_at
      React.DOM.td null, this.props.currency_record.value
      React.DOM.td null, this.props.currency_record.forced_till