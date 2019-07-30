require 'rails_helper'

RSpec.describe 'Weather Request', type: :request do
  it 'can retrieve the weather for a city' do
    get '/api/v1/forecast?location=denver,co'

    weather_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(weather_data).to have_key('data')
    expect(weather_data['data']['attributes']).to have_key('current_weather')
    expect(weather_data['data']['attributes']['current_weather']['time']).to be_a(Integer)
    expect(weather_data['data']['attributes']['current_weather']['summary']).to be_a(String)
    
    #needs more testing

    # expect(weather_data['data']['attributes']['current_weather']['time']).to be_a(Integer)
    # expect(weather_data['data']['attributes']['current_weather']['time']).to be_a(Integer)
  end
end
#current_weather summary
#current_weather tempeture
#current_weather location
#details symbol
