class Store
  def initialize(params)
    @params = params
  end

  def service
    @@service = BestBuyService.new
  end

  def closest_15_stores_within_25_miles(zip_code)
    stores = service.closest_15_stores_within_25_miles(zip_code)
    stores.map { |store| Store.new(store[:stores])}
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
