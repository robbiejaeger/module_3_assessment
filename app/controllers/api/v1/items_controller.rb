class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create

  end

  def destroy
    item = Item.find(item_params[:id])
    item.destroy
    render json: {}, status: :no_content
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :description, :image_url)
  end
end
