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

    it "returns store for given storeId" do
      VCR.use_cassette("store") do
        store_info = StoresService.new.find("1118")
        store = store_info["stores"].first

        expect(store["name"]).to eq("Hato Rey")
        expect(store["storeType"]).to eq("BigBox")
        expect(store["address"]).to eq("230 Calle Federico Costa Hato Rey")
        expect(store["city"]).to eq("San Juan")
        expect(store["region"]).to eq("PR")
        expect(store["postalCode"]).to eq("00918")
        expect(store["hoursAmPm"]).to eq("Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-7pm")
      end
    end
  end
end
