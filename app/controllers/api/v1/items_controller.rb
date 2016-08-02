class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: {}, status: :created
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: {}, status: :no_content
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
