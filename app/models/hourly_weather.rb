class HourlyWeather
    attr_reader :id,
              :time,
              :icon,
              :temperature


  def initialize(data)
    @id = 1
    @time = data['time']
    @icon = data['icon']
    @temperature = data['temperature']
  end

end