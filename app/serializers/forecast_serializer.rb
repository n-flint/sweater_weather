class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_summary, :current_temperature
end