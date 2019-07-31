class RoadtripFacade
  attr_reader :id

  def initialize(roadtrip_data)
    @id = 1
    @origin = roadtrip_data['origin']
    @destination = roadtrip_data['destination']
  end

  def travel_time
    roadtrip_service.duration['text']
  end

  def destination_coords
    roadtrip_service.destination_coords
  end

  def forecast
    current_forecast = DarkskyService.new(destination_coords).get_weather
    future_forecast = current_forecast['hourly']['data'][hour_offset]
    # require 'pry'; binding.pry
    HourlyWeather.new(future_forecast)
  end

  private

  def hour_offset
    travel_secs = roadtrip_service.duration['value']
    ((travel_secs / 3600.0).ceil) - 1
  end

  def roadtrip_service
    @roadtrip_service = RoadtripService.new(@origin, @destination)
  end
end