require 'rails_helper'

RSpec.describe Currency, type: :model do
  context "bad values" do
    it { expect(Currency.new(name: '12')).not_to be_valid }
    it { expect(Currency.new(name: '1234', value: '34.12')).not_to be_valid }
  end

  context "Good values" do
    it {expect(Currency.new(name: 'RUB', value: '25,00')).to be_valid }
  end
end
