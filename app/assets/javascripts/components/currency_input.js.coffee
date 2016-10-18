@CurrencyInput = React.createClass
  input_submit: (e)->
    e.preventDefault()
    console.log('Submited!')

  render: ->
    React.DOM.div
      className: 'row'
    #     React.DOM.div null
    #       className: 'col-md-4'
    #         React.DOM.div null
    #           className: 'form-group'
    #             React.DOM.input null
    #               name="currency[value]"
    #               type="string"
    #               placeholder="Forced currency value"
    #               # value={this.state.name}
    #               # onChange={this.handleNameChange}
    #               className="string form-control"
