require 'rails_helper'

describe "Items API controller" do
  it "finds all the items" do
    item1 = Item.create(name: "Item1")
    item2 = Item.create(name: "Item2")

    get '/api/v1/items'

    parsed_response = JSON.parse(response.body)
    expect(response.status).to eq(200)

    expect(parsed_response.length).to eq(2)
    expect(parsed_response[0]["name"]).to eq("Item1")
  end

  it "finds an item by id" do
    item1 = Item.create(name: "Item1")
    item2 = Item.create(name: "Item2")

    get '/api/v1/items/2'

    parsed_response = JSON.parse(response.body)
    expect(response.status).to eq(200)

    expect(parsed_response.length).to eq(3)
    expect(parsed_response["name"]).to eq("Item2")
  end

  it "can delete an item" do
    item1 = Item.create(name: "Item1")
    item2 = Item.create(name: "Item2")

    delete '/api/v1/items/2'

    expect(response.status).to eq(204)

    get '/api/v1/items'

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.length).to eq(1)
    expect(parsed_response[0]["name"]).to eq("Item1")
  end

  it "can create an item" do
    item1 = Item.create(name: "Item1")

    post '/api/v1/items', {item: {name: "Item2"}}

    expect(response.status).to eq(201)

    get '/api/v1/items'

    parsed_response = JSON.parse(response.body)

    expect(parsed_response.length).to eq(2)
    expect(parsed_response[1]["name"]).to eq("Item2")
  end
end
