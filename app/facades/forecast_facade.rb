class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
    # weather
  end

  def coordinates
    @geocode_service = GeocodeService.new(@location)
    @geocode_service.get_coordinates
  end

  def weather
    @darksky_service ||= DarkskyService.new(coordinates)
    @darksky_service.get_weather
  end

  def current_weather
    CurrentWeather.new(weather['currently'])
  end

  def hourly_weather
    weather['hourly']['data'].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def daily_weather
    weather['daily']['data'].map do |day|
      DailyWeather.new(day)
    end
  end

  def image
    @flickr_service = FlickrService.new(@location)

    FlickrImage.new(@flickr_service.get_image)
  end
end