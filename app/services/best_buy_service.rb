class BestBuyService
  def initialize
    @connection = Faraday.new('https://api.bestbuy.com') do |build|
      build.adapter :net_http
      build.request :url_encoded
      build.params[:format] = 'json'
      build.params[:apiKey] = ENV['BEST_BUY_KEY']
    end
  end

  def closest_15_stores_within_25_miles(zip_code)
    response =
      connection.get("/v1/stores((area(#{zip_code},25)))?pageSize=15")
    parse(response)
  end

  private
  attr_reader :connection

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
