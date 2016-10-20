@AdminContainer = React.createClass
  getInitialState: ->
    currency_list: this.props.currency_list

  createForcedCurrency: (currency_name, value, forced_till)->
    $.ajax
      type: 'POST'
      url: '/currency'
      data: { currency: { name: currency_name, value: value, forced_till: forced_till }},
      accepts: json: 'application/json'
      dataType: 'json'
      success: (currencies) ->
        @setState({ currency_list: currencies })
      error: (req, status, resp) ->
        console.log("Save failed with error: #{resp}")
  render: ->
    `<div>
      <CurrencyInput createForcedCurrency={this.createForcedCurrency} />
      <CurrensyList currency_list={this.state.currency_list} createForcedCurrency={this.createForcedCurrency}/>
    </div>`
