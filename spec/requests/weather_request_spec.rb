require 'rails_helper'

RSpec.describe 'Weather Request', type: :request do
  it 'can retrieve the weather for a city' do
    get '/api/v1/forecast?location=denver,co'

    weather_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(weather_data).to have_key('data')
    expect(weather_data['data']).to have_key('attributes')
  end
end

