require 'rails_helper'

describe "Items API" do
  it 'sends a list of all items #index' do
    id = create(:merchant).id
    items = create_list(:item, 5, merchant_id: id)

    get '/api/v1/items'

    expect(response).to be_successful

    items_response = JSON.parse(response.body, symbolize_names: true)
    item_attr = items_response[:data].first[:attributes]
    
    expect(items_response[:data].count).to eq(5)
    expect(item_attr[:name]).to be_a(String)
    expect(item_attr[:description]).to be_a(String)
    expect(item_attr[:unit_price]).to be_a(Float)
    expect(item_attr[:merchant_id]).to be_a(Integer)

  end
end