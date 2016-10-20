require 'rails_helper'

describe 'admin', js: true do
  context "list of currencies" do
    it "list has currencies", :retry => 3 do
      visit '/admin'
      expect(page).to have_content 'Value'
    end
  end
end