require 'rails_helper'

RSpec.describe CurrencyController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #admin" do
    it "returns http success" do
      get :admin
      expect(response).to have_http_status(:success)
    end
  end

  context "creation check" do
    it "normal creation" do
      post :create, { currency: { value: '30.5', name: 'USD' }}
      expect(Currency.count).to eq(1)
    end
  end

end
