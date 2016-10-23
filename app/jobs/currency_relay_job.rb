class CurrencyRelayJob
  @queue = :broadcast_queue

  def self.perform(currency)
    currency ||= Currency.get_active_or_last
    ActionCable.server.broadcast "currency_channel", currency: currency
  end
end