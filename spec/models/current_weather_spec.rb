require 'rails_helper'

RSpec.describe CurrentWeather do
  before :each do
    @test_data = {
      'time' => 1564543324,
      'summary' => "Mostly Cloudy",
      'icon' => "partly-cloudy-night",
      'temperature' => 77.86,
      'apparent_temperature' => 77.86,
      'humidity' => 0.37
    }
    @current_weather = CurrentWeather.new(@test_data)
  end
  it 'exists' do
    expect(@current_weather.class).to eq(CurrentWeather)
  end

  it 'has attributes' do
    expect(@current_weather.time).to eq(@test_data['time'])
    expect(@current_weather.summary).to eq(@test_data['summary'])
    expect(@current_weather.icon).to eq(@test_data['icon'])
    expect(@current_weather.temperature).to eq(@test_data['temperature'])
    expect(@current_weather.apparent_temperature).to eq(@test_data['apparent_temperature'])
    expect(@current_weather.humidity).to eq(@test_data['humidity'])
  end
end