class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :current_weather, :hourly_weather, :daily_weather
end