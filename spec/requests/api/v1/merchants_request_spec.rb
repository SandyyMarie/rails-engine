require 'rails_helper'
require 'pry'

describe "Merchants API" do
  it "sends a list of merchants #index" do
    merchants = create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    merchants_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(merchants_response[:data].count).to eq(3)

    # expect(merchants.first).to have_key(:id) -- throws erros
    expect(merchants.first[:id]).to be_an(Integer)
    # expect(merchants.first).to have_key(:name)
    expect(merchants.first[:name]).to be_a(String)

    #not sure how necessary testing each iteration is like in example
  end

  it "can get one book by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    # expect(merchant).to have_key(:name)
    expect(merchant[:data][:attributes][:name]).to be_a(String)

    # expect(book).to have_key(:author)
    expect(merchant[:data][:type]).to eq("merchant")
  end

  it 'can return the given merchants items' do
    id = create(:merchant).id
    items = create_list(:item, 3, merchant_id: id)
    get "/api/v1/merchants/#{id}/items"
    merchant_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    # require 'pry'; binding.pry
    expect(merchant_items[:data].first[:type]).to eq("item")
    expect(merchant_items[:data].first[:relationships][:merchant][:data][:id]).to eq(id.to_s)
    expect(merchant_items[:data].first[:attributes][:name]).to be_a(String)
    expect(merchant_items[:data].first[:attributes][:name]).to be_a(String)
    expect(merchant_items[:data].first[:attributes][:description]).to be_a(String)
    expect(merchant_items[:data].first[:attributes][:unit_price]).to be_a(Float)

  end
  
end