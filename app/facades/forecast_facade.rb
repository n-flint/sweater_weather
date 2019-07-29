class ForecastFacade

  def initialize(location)
    @id = 1
    @location = location
    weather
  end

  def coordinates
    @geocode_service = GeocodeService.new(@location)
    @geocode_service.get_coordinates
  end

  def weather
    @darksky_service = DarkskyService.new(coordinates)
    @darksky_service.get_weather
  end


end