require 'rails_helper'

describe 'admin', js: true do
  context "list of currencies" do
    it "list has currencies" do
      Currency.create(name: 'USD', value: '40.34')
      visit '/admin'
      # puts page.html
      expect(page).to have_content('Value')
      # expect(page).to have_content('40.34')
    end
  end
end