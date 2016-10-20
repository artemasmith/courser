class @CurrencyInput extends React.Component
  onSubmit: (e) ->
    e.preventDefault()
    this.props.createForcedCurrency('USD', this.state.value, this.state.forced_till)
  render: ->
    `<div className="row">
      <div className="col-md-6 input-group"></div>
      <div className="col-md-6">
        <form data-toggle="validator" role="form">
          <div className="form-group has-feedback">
            <label htmlFor="currency-value" className="control-label">Value</label>
            <input type="text" className="form-control" pattern="^[0-9]{1,}[.]{0,1}[0-9]{0,2}$" id="currency-value" name="currency[value]" placeholder="Value" required/>
            <span className="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div className="help-block with-errors">Please provide value in format XX.YY [12.00]</div>
          </div>
          <div className="form-group">
            <label htmlFor="forced-till" className="control-label">Forced till</label>
            <input type="text" name="currency[forced_tull]" className="form-control datetimepicker" id="forced-till" required/>
            <span className="glyphicon form-control-feedback" aria-hidden="true"></span>
          </div>
          <button type="submit" className="btn btn-submit" onClick={this.onSubmit}>Create</button>
        </form>
      </div>
    </div>`
