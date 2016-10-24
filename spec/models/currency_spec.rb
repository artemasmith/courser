require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "bad values" do
    it { expect(Currency.new(name: '12')).not_to be_valid }
    it { expect(Currency.new(name: '1234', value: '34,12')).not_to be_valid }
  end

  context "Good values" do
    it { expect(Currency.new(name: 'RUB', value: '25.00')).to be_valid }
    it "forced value" do
      currency0 = create(:currency, forced_till: Time.now + 1.day)
      currency = create(:currency, forced_till: Time.now + 1.day)
      currency2 = create(:currency)
      expect(Currency.get_active).to eq(currency)
    end
    it "get_active_or_last" do
      currency1 = create(:currency, forced_till: Time.now - 1.day)
      currency2 = create(:currency)
      expect(Currency.get_active_or_last).to eq(currency2)
    end
  end
end
