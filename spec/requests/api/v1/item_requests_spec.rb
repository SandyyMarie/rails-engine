require 'rails_helper'

describe "Items API" do
  it 'sends a list of all items #index' do
    id = create(:merchant).id
    items = create_list(:item, 5, merchant_id: id)

    get '/api/v1/items'

    expect(response).to be_successful

    items_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(items_response[:data].count).to eq(5)

    expect(items_response.first[:id]).to be_an(Integer)
    expect(items_response.first[:name]).to be_a(String)
    expect(items_response.first[:name]).to be_a(String)
    expect(items_response.first[:name]).to be_a(String)
    expect(items_response.first[:name]).to be_a(String)

  end
end