class FlickrService

  def initialize(location)
    @location = location
  end

  def image_data
    JSON.parse(conn)['photos']['photo'][0]
  end


  private

  def conn
    response = Faraday.get('https://api.flickr.com/services/rest/') do |f|
      f.params['api_key'] = ENV['FLICKR_API_KEY']
      f.params['method'] = 'flickr.photos.search'
      f.params['tags'] = "#{@location},skyline,weather"
      f.params['text'] = "#{@location}"
      f.params['nojsoncallback'] = 1
      f.params['format'] = 'json'
    end
    response.body
  end
end