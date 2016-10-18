require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "bad values" do
    it { expect(Currency.new(name: '12')).not_to be_valid }
    it { expect(Currency.new(name: '1234', value: '34,12')).not_to be_valid }
  end

  context "Good values" do
    it { expect(Currency.new(name: 'RUB', value: '25.00')).to be_valid }
    it "forced value" do
      currency0 = Currency.create(name: 'USD', value: '50.30', forced_till: Time.now + 1.day)
      currency = Currency.create(name: 'USD', value: '40.30', forced_till: Time.now + 1.day)
      currency2 = Currency.create!(name: 'USD', value: '42.20')
      expect(Currency.get_active).to eq(currency)
    end
  end
end
