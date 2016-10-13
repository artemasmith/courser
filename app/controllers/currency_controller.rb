class CurrencyController < ApplicationController
  def index
    @currency = Currency.last
  end

  def create
  end

  def admin
  end
end
