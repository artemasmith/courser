@currencyRecord = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @currency_record.created_at
      React.DOM.td null, @currency_record.value
      React.DOM.td null, @currency_record.force