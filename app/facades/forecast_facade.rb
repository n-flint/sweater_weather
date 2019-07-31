class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def coordinates
    @geocode_service ||= GeocodeService.new(@location)
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
    @flickr_service ||= FlickrService.new(@location)

    FlickrImage.new(@flickr_service.image_data)
  end

  def link 
    "https://farm#{@flickr_service.image_data['farm']}.staticflickr.com/#{@flickr_service.image_data['server']}/#{@flickr_service.image_data['id']}_#{@flickr_service.image_data['secret']}.jpg"
  end
end