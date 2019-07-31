require 'rails_helper'
# require 'webmock/rspec'

RSpec.describe 'Road Trip Request', type: :request do
  it 'can receive weather for hour of arrival at destination with valid api key' do
    VCR.use_cassette('roadtrip') do

      user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password', api_key: 'e071de0434ac8582cd53')
      roadtrip_json = {
                      "origin": "Denver,CO", 
                      "destination": "Pueblo,CO",
                      "api_key": 'e071de0434ac8582cd53'
        }.to_json

      headers = { 'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/road_trip', params: roadtrip_json, headers: headers

      weather_data = JSON.parse(response.body)

      expect(response.code).to eq('200')
      expect(weather_data).to have_key('data')
      expect(weather_data['data']['attributes']['travel_time']).to be_a(String)
      expect(weather_data['data']['attributes']['forecast']['temperature']).to be_a(Numeric)
      expect(weather_data['data']['attributes']['forecast']['summary']).to be_a(String)
    end
  end
  it 'receives a 404 with invalid api kay' do
    VCR.use_cassette('roadtrip') do

      user = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password', api_key: 'e071de0434ac8582cd53')
      roadtrip_json = {
                      "origin": "Denver,CO", 
                      "destination": "Pueblo,CO",
                      "api_key": 'invalid-key'
        }.to_json

      headers = { 'CONTENT_TYPE' => 'application/json'}
      post '/api/v1/road_trip', params: roadtrip_json, headers: headers

      weather_data = JSON.parse(response.body)

      expect(response.code).to eq('404')
    end
  end
end


