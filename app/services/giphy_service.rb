class GiphyService

  def initialize(query)
    @query = query
  end

  def get_url
    response.first[1][0]['images']['original']['url']
  end
    
  private

  def conn
    Faraday.new("http://api.giphy.com/v1/gifs/search") do |f|
      f.params['api_key'] = ENV['GIPHY_API_KEY']
      f.params['q'] = @query
      f.adapter Faraday.default_adapter
    end
  end

  def response
    response = conn.get
    JSON.parse(response.body)
  end
end
