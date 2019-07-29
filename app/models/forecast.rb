class Forecast
  attr_reader :id, :current_summary, :current_temperature
  
  def initialize(weather_data)
    @id = 1
    @current_summary = weather_data['currently']['summary']
    @current_temperature = weather_data['currently']['temperature']
  end

end