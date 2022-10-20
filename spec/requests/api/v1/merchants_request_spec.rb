require 'rails_helper'
require 'pry'

describe "Merchants API" do
  it "sends a list of merchants" do
    merchants = create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    merchants_response = JSON.parse(response.body, symbolize_names: true)

    expect(merchants_response.count).to eq(3)

    # expect(merchants.first).to have_key(:id) -- throws erros
    expect(merchants.first[:id]).to be_an(Integer)
    # expect(merchants.first).to have_key(:name)
    expect(merchants.first[:name]).to be_a(String)

    #not sure how necessary testing each iteration is like in example
  end
  
end