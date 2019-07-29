class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_coordinates
    service['results'][0]['geometry']['location']
  end

  private

  def service
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&key=#{ENV['GOOGLE_API_KEY']}")
    data = JSON.parse(response.body)
  end
end
