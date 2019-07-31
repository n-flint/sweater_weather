class HourlyWeather
    attr_reader :id,
              :time,
              :icon,
              :temperature,
              :summary


  def initialize(data)
    @id = 1
    @time = data['time']
    @icon = data['icon']
    @temperature = data['temperature']
    @summary = data['summary']
  end
end