class StoresService

  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def find_by_zip(zip)
    response
  end

  private

  def parse_response(response)
    JSON.parse(response)
  end
end
