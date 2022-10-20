require 'rails_helper'
require 'pry'

describe "Merchants API" do
  it "sends a list of merchants" do
    merchants = create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    books_response = JSON.parse(response.body, symbolize_names: true)
  end
  
end