class GiphyFacade
  attr_reader :id

  def initialize(location)
    @id = 1
    @location = location
  end

  def images
    daily_data = ForecastFacade.new(@location).daily_weather
    daily_data.map do |day|
      url = GiphyService.new(day.icon).get_url
      Giphy.new(day, url)
    end
  end
end