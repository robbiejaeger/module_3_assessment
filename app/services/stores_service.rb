class StoresService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def find_by_zip(zip)
    response = @conn.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'storeId,longName,city,distance,phone,storeType'
      req.params['pageSize'] = '15'
      req.params['apiKey'] = ENV['BEST_BUY_API']
    end
    parse_response(response)
  end

  def find(store_id)
    response = @conn.get do |req|
      req.url "/v1/stores(storeId=#{store_id})"
      req.params['format'] = 'json'
      req.params['show'] = 'name,storeType,address,city,region,postalCode,hoursAmPm'
      req.params['apiKey'] = ENV['BEST_BUY_API']
    end
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body)
  end
end
