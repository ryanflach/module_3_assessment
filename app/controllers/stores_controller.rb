class StoresController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,#{params[:zip_code]})))?apiKey=#{ENV['BEST_BUY_KEY']}&pageSize=15&callback=JSON_CALLBACK&format=json")
    @stores = JSON.parse(response.body)
  end
end
