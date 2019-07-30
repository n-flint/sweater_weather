class DailyWeather
  attr_reader :id,
              :time,
              :summary,
              :icon,
              :temperature,
              :precip_robability,
              :precip_type,
              :temperature_high,
              :temperature_low

  def initialize(data)
    @id = 1
    @time = data['time']
    @summary = data['summary']
    @icon = data['icon']
    @temperature = data['temperature']
    @precip_robability = data['precipProbability']
    @precip_type = data['precipType']
    @temperature_high = data['temperatureHigh']
    @temperature_low = data['temperatureLow']

  end

end