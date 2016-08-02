class StoresService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def find_by_zip(zip)
    response = @conn.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params['format'] = 'json'
      req.params['show'] = 'longName,city,distance,phone,storeType'
      req.params['pageSize'] = '15'
      req.params['apiKey'] = ENV['BEST_BUY_API']
    end

    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response)
  end
end
