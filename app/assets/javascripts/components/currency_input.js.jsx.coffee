@CurrencyInput = React.createClass
  getInitialState: ->
    value: ''
    forced_till: ''
    name: 'USD'

  handleChange: (e)->
    name = e.target.name
    @setState "#{ name }": e.target.value

  getDatePicker: (e)->
    @setState "forced_till": $('.datetimepicker').val()
    console.log($('.datetimepicker').val())

  onSubmit: (e) ->
    e.preventDefault()
    $.post '/currency', { currency: @state }, (data) =>
      @props.handleNewCurrency data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    `<div className="row">
      <div className="col-md-6 input-group"></div>
      <div className="col-md-6">
        <form data-toggle="validator" role="form" onSubmit={this.onSubmit}>
          <div className="form-group has-feedback">
            <label htmlFor="currency-value" className="control-label">Value</label>
            <input type="text" className="form-control" pattern="^[0-9]{1,}[.]{0,1}[0-9]{0,4}$" id="currency-value" name="value" onChange={this.handleChange} placeholder="Value" required/>
            <span className="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div className="help-block with-errors">Please provide value in format XX.YY [12.00]</div>
          </div>
          <div className="form-group">
            <label htmlFor="forced-till" className="control-label">Forced till</label>
            <input type="text" name="forced_till" className="form-control datetimepicker" id="forced-till" required/>
            <span className="glyphicon form-control-feedback" aria-hidden="true"></span>
          </div>
          <button type="submit" className="btn btn-primary" onClick={this.getDatePicker}>Create</button>
        </form>
      </div>
    </div>`
