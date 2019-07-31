class RoadtripService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def destination_coords
    response['routes'][0]['legs'][0]['end_location']
  end

  def duration
    response['routes'][0]['legs'][0]['duration']
  end

  private
  
  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}") do |f|
      f.params['key'] = ENV['GOOGLE_MAPS_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def response
    response = conn.get
    JSON.parse(response.body)
  end
end