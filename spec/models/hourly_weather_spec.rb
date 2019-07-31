require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    @hour_data = {
      'time' => 1564543324,
      'summary' => "Mostly Cloudy",
      'icon' => "partly-cloudy-night",
      'temperature' => 77.86,
      'precip_probability' => 0.12,
      'precip_type' => "rain",
      'temperature_high' => 92.68,
      'temperature_low' => 70.56
    }
    @hour_weather = HourlyWeather.new(@hour_data)
  end
  it 'exists' do
    expect(@hour_weather.class).to eq(HourlyWeather)
  end

  it 'has attributes' do
    expect(@hour_weather.time).to eq(@hour_data['time'])
    expect(@hour_weather.summary).to eq(@hour_data['summary'])
    expect(@hour_weather.icon).to eq(@hour_data['icon'])
    expect(@hour_weather.temperature).to eq(@hour_data['temperature'])
  end
end