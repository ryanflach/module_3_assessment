class Store
  attr_reader :total

  def initialize(params)
    @params = params
    @total = @@total
  end

  def self.service
    @@service = BestBuyService.new
  end

  def self.closest_15_stores_within_25_miles(zip_code)
    raw_stores = service.closest_15_stores_within_25_miles(zip_code)
    @@total = raw_stores[:total]
    raw_stores[:stores].map { |store| Store.new(store) }
  end

  def name
    params[:longName]
  end

  def city
    params[:city]
  end

  def distance
    params[:distance]
  end

  def phone
    params[:phone]
  end

  def store_type
    params[:storeType]
  end

  private
  attr_reader :params
end
