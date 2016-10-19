var CurrencyInput = React.createClass({
  onSubmit: function(e) {
    e.preventDefault();
    this.props.createForcedCurrency(this.state.value, this.state.forced_till)
  },

  render: function() {
    return (
    <div className="row">
      <div className="col-md-4 input-group"></div>
      <div className="col-md-4">
      <form data-toggle="validator" role="form">
        <div className="input-group">
          <input name="currency[value]" className="form-control" placeholder="Value" required/>
          <input name="currency[forced_tull]" className="form-control" placeholder="Forced till" type="date"/>
          <button type="submit" className="btn btn-submit" onClick={this.onSubmit}>Save</button>
        </div>
      </form>
      </div>
    </div>
    );
  }
});
