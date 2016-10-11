require 'rails_helper'

RSpec.describe CbrPullJob do
  before do
    ResqueSpec.reset!
  end

  it "normal creation" do
    currency = CBR.daily.valutes.find{ |v| v.char_code == 'USD' }.value
    Resque.enqueue(CbrPullJob)
    ResqueSpec.perform_next('pull_cbr_queue')
    expect(Currency.last.value).to eq(currency.to_s)
  end
end