require 'rails_helper'

describe StoresService do
  context "#find_by_zip" do
    it "returns a list of stores for given zipcode" do
      VCR.use_cassette("stores") do
        stores_info = StoresService.new.find_by_zip("80202")
        stores = stores_info["stores"]
        store = stores.first

        expect(stores.count).to eq(15)
        expect(store["storeId"]).to eq(2740)
        expect(store["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
      end
    end
  end
end
