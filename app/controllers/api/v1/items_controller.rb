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

  def destroy
    render json: Item.delete(params[:id])
  end

  def update
    if Item.update(params[:id], item_params).save
      render json: ItemSerializer.new(Item.update(params[:id], item_params)), status: 201
    else
      render status: 404
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end