require 'rails_helper'
require 'spec_helper.rb'

RSpec.describe CbrPullJob do
  before do
    ResqueSpec.reset!
  end

  it "normal creation" do
    currency = CBR.daily.valutes.find{ |v| v.char_code == 'USD' }.value
    puts currency
    ResqueSpec.perform_next('pull_cbr_queue')
    # expect(Currency.last.value).to eq(currency)
    expect(Currency.count).to be > 0
  end
end