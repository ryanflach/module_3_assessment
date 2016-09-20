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

  def self.find(id)
    Store.new(service.find_store_by_id(id))
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

  def id
    params[:storeId]
  end

  def full_address
    "#{params[:address]}, #{params[:address2]}\n" \
    "#{params[:city]}, #{params[:region]}, #{params[:fullPostalCode]}"
  end

  def hours
    params[:hoursAmPm].split(';').map { |day| day.strip }
  end

  private
  attr_reader :params
end
