class Store < OpenStruct

  def self.service
    @service = StoresService.new
  end

  def self.find_by_zip(zip)
    parsed_stores = service.find_by_zip(zip)
    byebug
  end
end
