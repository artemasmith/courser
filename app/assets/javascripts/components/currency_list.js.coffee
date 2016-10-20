@Currencies = React.createClass
  getInitialState: ->
    currency_list: @currency_list
  getDefaultProps: ->
    currency_list: []
  createForcedCurrency: (currency_name, value, forced_till)->
    $.ajax
      type: 'POST'
      url: '/currency'
      data: { currency: { name: currency_name, value: value, forced_till: forced_till }},
      accepts: json: 'application/json'
      dataType: 'json'
      success: (req, status, resp) ->
        this.setState(changed: true)
      error: (req, status, resp) ->
        alert "Save failed with error: #{resp}"
  render: ->
    React.DOM.div
      className: 'currency-list'
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
