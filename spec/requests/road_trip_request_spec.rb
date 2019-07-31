require 'rails_helper'
# require 'webmock/rspec'

RSpec.describe 'Road Trip Request', type: :request do
  it 'can receive weather for hour of arrival at destination' do
    # not sure how to web mock this yet
    # json_roadtrip_response = File.open("./fixtures/roadtrip.json")
    # stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json").
    #     with(
    #       headers: {
    #      'Accept'=>'*/*',
    #      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #      'User-Agent'=>'Faraday v0.15.4'
    #       })
    #       .to_return(status: 200, body: json_roadtrip_response, headers: {})

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
    expect(weather_data['data']['attributes']['forecast']['temperature']).to be_a(Numeric)
    expect(weather_data['data']['attributes']['forecast']['summary']).to be_a(String)
  end
end


