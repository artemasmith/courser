class CbrPullJob
  @queue = :pull_cbr_queue
  def self.perform(currency = 'USD')
    puts "sdfsdfsds"
    currency = Currency.new
    currency.name = currency
    currency.value = get_daily(currency)
    currency.save!
  end

  def self.get_daily(currency_code)
    CBR.daily.valutes.find{ |valuta| valute.char_code == currency_code }.value
  end
end
