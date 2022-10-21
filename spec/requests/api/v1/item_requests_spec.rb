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

  it 'can return a single item' do
    item = create(:item)
    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    items_response = JSON.parse(response.body, symbolize_names: true)
    item_attr = items_response[:data][:attributes]

    expect(item_attr.count).to eq(4)
    expect(item_attr[:name]).to be_a(String)
    expect(item_attr[:description]).to be_a(String)
    expect(item_attr[:unit_price]).to be_a(Float)
    expect(item_attr[:merchant_id]).to be_a(Integer)
  end

  it 'can create an item' do
    merchant = create(:merchant)
    item_params = ({
      name: "Winter Boots",
      description: "The warmest snow boots in town",
      unit_price: 175,
      merchant_id: merchant.id
    })
    post "/api/v1/items", params: {item: item_params }, as: :json

    new_item = Item.last

    expect(response).to be_successful

    expect(item_attr.count).to eq(4)
    expect(item_attr[:name]).to be_a(item_params[:name])
    expect(item_attr[:description]).to be_a(item_params[:description])
    expect(item_attr[:unit_price]).to be_a(item_params[:unit_price])
    expect(item_attr[:merchant_id]).to be_a(item_params[:merchant_id])
  end
end