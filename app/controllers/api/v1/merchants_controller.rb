class Api::V1::MerchantsController < ApplicationController
  def index
    #@merchants = Merchant.all
    # render json: MerchantSerializer.new(Merchant.all)
    render json: Merchant.all
  end
end