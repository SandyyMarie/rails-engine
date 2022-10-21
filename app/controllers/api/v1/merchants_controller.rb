class Api::V1::MerchantsController < ApplicationController
  def index
    if params[:item_id] != nil
      item = Item.find(params[:item_id])
      render json: MerchantSerializer.new(Merchant.find(item.merchant_id))
    else
      render json: MerchantSerializer.new(Merchant.all)
    end
  end

  def show
    if Merchant.exists?(params[:id])
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    else
      render status: 404
    end
  end
end