class DarkskyService


  def initialize(coordinates)
    @latitude = coordinates['lat']
    @longitude = coordinates['lng']
  end

  def get_weather
    Rails.cache.fetch('get_weather', expires_in: 2.hours) do
      JSON.parse(response.body)
    end
  end

  private
  def conn
    response = Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def response 
    conn.get("#{@latitude},#{@longitude}")
  end
end