class CbrPullJob
  @queue = :pull_cbr_queue

  def self.perform(currency = 'USD')
    db_currency = Currency.new
    db_currency.name = currency
    db_currency.value = get_daily(currency).to_s
    db_currency.save
  end

  def self.get_daily(currency_code)
    CBR.daily.valutes.find{ |valuta| valuta.char_code == currency_code }.value
  end
end
