class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id] != nil
      merchant = Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(merchant.items)
    else #if merchant is nil thus not looking for merchant.items
      render json: ItemSerializer.new(Item.all)
    end
  end

end