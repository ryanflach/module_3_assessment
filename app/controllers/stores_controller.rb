class StoresController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(#{params[:zip_code]},25)))?apiKey=#{ENV['BEST_BUY_KEY']}&pageSize=15&format=json")
    @zip_code = params[:zip_code]
    parsed = JSON.parse(response.body, symbolize_names: true)
    @total = parsed[:total]
    @stores = parsed[:stores]
  end
end
