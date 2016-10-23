var Currency = React.createClass({
  getInitialState: function() {
    return {currency: this.props.currency};
  },

  updateCurrency: function(data){
    this.setState({currency: data.currency});
  },
  componentDidMount: function() {
    this.setSubscription();
  },
  setSubscription: function() {
    App.message = App.cable.subscriptions.create("CurrencyBroadcastChannel", {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        this.updateCurrency(data);
      },
      updateCurrency: this.updateCurrency
    });
  },

  render: function() {
    return (
      <div className='currency'> 
        <h2 className='h2'>
        <label>  {this.state.currency.name} {this.state.currency.value}</label>
        </h2>
      </div>);
  }
});
