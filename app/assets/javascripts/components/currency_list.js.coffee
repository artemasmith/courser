@CurrensyList = React.createClass
  getInitialState: ->
    currency_list: this.props.currency_list
  getDefaultProps: ->
    currency_list: []
  addCurrency: (record) ->
    currencies = @state.currency_list
    currencies.unshift record
    @setState currency_list: currencies

  render: ->
    React.DOM.div
      className: 'test'
      React.createElement CurrencyInput, handleNewCurrency: @addCurrency
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
            for record in @state.currency_list
              React.createElement CurrencyRecord, key: record.id, currency_record: record

