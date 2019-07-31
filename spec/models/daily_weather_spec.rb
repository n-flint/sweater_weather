require 'rails_helper'

RSpec.describe DailyWeather do
  before :each do
    @day_data = {
      'time' => 1564543324,
      'summary' => "Mostly Cloudy",
      'icon' => "partly-cloudy-night",
      'temperature' => 77.86,
      'precip_probability' => 0.12,
      'precip_type' => "rain",
      'temperature_high' => 92.68,
      'temperature_low' => 70.56
    }
    @daily_weather = DailyWeather.new(@day_data)
  end
  it 'exists' do
    expect(@daily_weather.class).to eq(DailyWeather)
  end

  it 'has attributes' do
    expect(@daily_weather.time).to eq(@day_data['time'])
    expect(@daily_weather.summary).to eq(@day_data['summary'])
    expect(@daily_weather.icon).to eq(@day_data['icon'])
    expect(@daily_weather.temperature).to eq(@day_data['temperature'])
  end
end