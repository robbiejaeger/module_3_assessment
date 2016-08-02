class Store < OpenStruct

  def service
    StoresService.new
  end

  def self.find_by_zip(zip)
    parsed_stores = service.find_by_zip(zip)
  end
end
