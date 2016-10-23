require 'rails_helper'

describe 'admin', js: true, type: :feature do
  context "list of currencies" do
    let(:value) { return '45.6'}
    let(:forced_till) { return (Time.now + 1.hour).strftime('%d/%m/%Y %H:%M:%S') }

    it "normal creation" do
      visit '/admin'
      within('#create-currency') do
        fill_in "value", with: value
        fill_in "forced_till", with: forced_till
      end
      click_button 'Create'
      
      expect(page).to have_content('45.6')
      expect(Currency.count).to eq(1)
    end

    it "validation failed" do
      visit '/admin'
      within('#create-currency') do
        fill_in "value", with: value
        
      end
      click_button 'Create'
      
      expect(page).not_to have_content('45.6')
      expect(Currency.count).not_to eq(1)
    end

    it "validation failed" do
      visit '/admin'
      within('#create-currency') do
        fill_in "forced_till", with: forced_till
        
      end
      click_button 'Create'
      
      expect(page).not_to have_content('45.6')
      expect(Currency.count).not_to eq(1)
    end
  end
end