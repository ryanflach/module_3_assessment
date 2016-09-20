class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find_by_id(params[:id])
    if @item && @item.destroy
      render :show, status: 204
    end
  end

  def create
    @item = Item.new(item_params)
    render :show, status: 201 if @item.save
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
