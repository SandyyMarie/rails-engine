class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id] != nil
      merchant = Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(merchant.items)
    else #if merchant is nil thus not looking for merchant.items
      render json: ItemSerializer.new(Item.all)
    end
  end

  def show
    if Item.exists?(params[:id])
      render json: ItemSerializer.new(Item.find(params[:id]))
    else
      render status: 404
    end
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params)), status: 201
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end