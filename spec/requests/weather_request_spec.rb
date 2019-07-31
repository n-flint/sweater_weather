require 'rails_helper'

RSpec.describe 'Weather Request', type: :request do
  it 'can retrieve the weather for a city' do
    VCR.use_cassette('weather') do

    get '/api/v1/forecast?location=denver,co'

    weather_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(weather_data).to have_key('data')

    expect(weather_data['data']['attributes']['current_weather']['time']).to be_a(Integer)
    expect(weather_data['data']['attributes']['current_weather']['summary']).to be_a(String)

    expect(weather_data['data']['attributes']['hourly_weather'][0]['time']).to be_a(Integer)
    expect(weather_data['data']['attributes']['hourly_weather'][0]['icon']).to be_a(String)
    expect(weather_data['data']['attributes']['hourly_weather'][0]['temperature']).to be_a(Float)
    expect(weather_data['data']['attributes']['hourly_weather'][0]['summary']).to be_a(String)

    expect(weather_data['data']['attributes']['daily_weather'][0]['time']).to be_a(Integer)
    expect(weather_data['data']['attributes']['daily_weather'][0]['summary']).to be_a(String)
    expect(weather_data['data']['attributes']['daily_weather'][0]['icon']).to be_a(String)
    expect(weather_data['data']['attributes']['daily_weather'][0]['precip_probability']).to be_a(Float)
    expect(weather_data['data']['attributes']['daily_weather'][0]['precip_type']).to be_a(String)
    expect(weather_data['data']['attributes']['daily_weather'][0]['temperature_high']).to be_a(Float)
    expect(weather_data['data']['attributes']['daily_weather'][0]['temperature_low']).to be_a(Float)
    end
  end
end
