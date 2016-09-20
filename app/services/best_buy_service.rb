class BestBuyService
  def initialize
    @connection = Faraday.new('https://api.bestbuy.com') do |build|
      build.adapter :net_http
      build.request :url_encoded
    end
  end

  def stores_within_25_miles(zip_code)
    connection.get()
  end

  private
  attr_reader :connection
end
