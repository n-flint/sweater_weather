class ForecastFacade

  def initialize(location)
    @id = 1
    @location = location
    coordinantes
  end

  def coordinantes
    @service = GeocodeService.new(@location)
    @service.get_coordinates
    require 'pry'; binding.pry
  end


end