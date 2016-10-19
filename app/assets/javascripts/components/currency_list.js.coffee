@Currencies = React.createClass
  getInitialState: ->
    currency_list: @currency_list
  getDefaultProps: ->
    currency_list: []
  createForcedCurrency: ->
    this.setState(changed: true)
  render: ->
    React.DOM.table
      className: 'table table-bordered'
      React.DOM.thead null,
        React.DOM.tr null,
          React.DOM.th null, 'Date'
          React.DOM.th null, 'Value'
          React.DOM.th null, 'Forced by admin'
      React.DOM.tbody null,
        for record in this.props.currency_list
          React.createElement CurrencyRecord, key: record.id, currency_record: record
