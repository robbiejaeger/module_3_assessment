require 'rails_helper'

describe "Items API controller" do
  it "finds all the items" do
    item1 = Item.create(name: "Item1")
    item2 = Item.create(name: "Item2")

    get '/api/v1/messages'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['messages'].length).to eq(10)
  end
end
