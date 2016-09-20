class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end
end
