class CurrencyController < ApplicationController

  def index
    @currency = Currency.get_active_or_last || ''
  end

  def create
    currency = Currency.new(currency_params)
    if currency.save
      render status: 200, json: currency
    else
      errors = currency.errors.full_messages
      render status: 500, json: errors.to_json
    end
  end

  def admin
    @currency_list = Currency.for_selection
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :value, :forced_till)
  end
end
