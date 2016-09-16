require 'rails_helper'
require 'spec_helper.rb'

RSpec.describe Jobs::CbrJob do
  before do
    ResqueSpec.reset!
  end

  # it "normal creation" do
  #   currency = CBR.daily.valutes.find{ |v| v.char_code == 'USD' }.value
  #   # ResqueSpec.perform_next("Jobs::CbrJob")
  #   expect(currency.last.value).to eq(currency)
  # end
end