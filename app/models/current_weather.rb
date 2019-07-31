class CurrentWeather
  attr_reader :id,
              :time,
              :summary,
              :icon,
              :temperature,
              :apparent_temperature,
              :humidity

  def initialize(data)
    @id = 1
    @time = data['time']
    @summary = data['summary']
    @icon = data['icon']
    @temperature = data['temperature']
    @apparent_temperature = data['apparent_temperature']
    @humidity = data['humidity']
  end

end