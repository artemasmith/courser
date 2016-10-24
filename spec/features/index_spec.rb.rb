require 'rails_helper'

describe 'root', js: true, type: :feature do
  let(:currency1) { create(:currency) }
  let(:currency2) { create(:currency, forced_till: (Time.now + 1.hour)) }
  it "live change" do
    currency1
    visit :index
    currency2
    sleep 2
    expect(page).to have_content('40')
  end
end