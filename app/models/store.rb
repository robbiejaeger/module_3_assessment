class Store < OpenStruct

  def self.service
    @service = StoresService.new
  end

  def self.find_by_zip(zip)
    raw_response = service.find_by_zip(zip)

    stores = raw_response["stores"].map do |raw_store|
      Store.new(raw_store)
    end

    return stores, raw_response["total"]
  end

  def self.find(store_id)
    raw_response = service.find(store_id)

    store = raw_response["stores"].map do |raw_store|
      Store.new(raw_store)
    end[0]
  end

  def hours
    hoursAmPm.split("; ")
  end
end
