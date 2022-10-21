require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants #index" do
    merchants = create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    merchants_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(merchants_response[:data].count).to eq(3)

    expect(merchants.first[:id]).to be_an(Integer)
    expect(merchants.first[:name]).to be_a(String)
  end

  it "can get one book by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(merchant[:data][:attributes][:name]).to be_a(String)
    expect(merchant[:data][:type]).to eq("merchant")
  end

  it 'can return the given merchants items' do
    id = create(:merchant).id
    items = create_list(:item, 3, merchant_id: id)

    get "/api/v1/merchants/#{id}/items"
    
    expect(response).to be_successful

    merchant_items = JSON.parse(response.body, symbolize_names: true)
    merch_attr = merchant_items[:data].first[:attributes] #testing first merchant only

    expect(merchant_items[:data].first[:type]).to eq("item")
    expect(merch_attr[:merchant_id]).to eq(id)
    expect(merch_attr[:name]).to be_a(String)
    expect(merch_attr[:name]).to be_a(String)
    expect(merch_attr[:description]).to be_a(String)
    expect(merch_attr[:unit_price]).to be_a(Float)

  end
  
end