class StoresController < ApplicationController
  def index
    @stores = Store.closest_15_stores_within_25_miles(params[:zip_code])
  end

  def show
    @store = Store.find(params[:id])
  end
end
