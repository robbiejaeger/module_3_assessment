class Store < OpenStruct

  def self.service
    @service = StoresService.new
  end

  def self.find_by_zip(zip)
    raw_response = service.find_by_zip(zip)

    store_objects = raw_response["stores"].map do |raw_store|
      Store.new(raw_store)
    end

    return store_objects, raw_response["total"]
  end
end
