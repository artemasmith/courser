@CurrensyList = React.createClass
  getInitialState: ->
    currency_list: this.props.currency_list
    updateForm: @props.updateForm
  getDefaultProps: ->
    currency_list: []

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
