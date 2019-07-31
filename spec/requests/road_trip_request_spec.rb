require 'rails_helper'

RSpec.describe 'Road T\rip Request', type: :request do
  it 'can receive weather for hour of arrival at destination' do
    user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
    roadtrip_json = {
                    "origin": "Denver,CO", 
                    "destination": "Pueblo,CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4"
      }.to_json

    headers = { 'CONTENT_TYPE' => 'application/json'}
    post '/api/v1/road_trip', params: roadtrip_json, headers: headers

    weather_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(weather_data).to have_key('data')
    expect(weather_data['data']['attributes']['travel_time']).to be_a(String)
    expect(weather_data['data']['attributes']['tempeature']).to be_a(Numeric)
    expect(weather_data['data']['attributes']['summary']).to be_a(String)
  end
end


