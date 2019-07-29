class DarkskyService


  def initialize(coordinates)
    @latitude = coordinates['lat']
    @longitude = coordinates['lng']
  end

  def get_weather
    service

  end

  private
  def service
    
  end
end