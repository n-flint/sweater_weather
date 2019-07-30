require 'rails_helper'

RSpec.describe 'Giphy Request', type: :request do
  it 'can retrieve a gif based on the weather for a city' do
    get '/api/v1/gifs?location=denver,co'

    giphy_data = JSON.parse(response.body)

    expect(response.code).to eq('200')
    expect(giphy_data).to have_key('data')

    expect(giphy_data['data']['attributes']).to have_key('images')
    expect(giphy_data['data']['attributes']['images'][0]['time']).to be_a(Integer)
    expect(giphy_data['data']['attributes']['images'][0]['summary']).to be_a(String)
    expect(giphy_data['data']['attributes']['images'][0]['url']).to be_a(String)

    # without using fast json api
    # expect(giphy_data['data']).to have_key('images')
    # expect(giphy_data['data']['images'][0]['time']).to be_a(Integer)
    # expect(giphy_data['data']['images'][0]['summary']).to be_a(String)
    # expect(giphy_data['data']['images'][0]['url']).to be_a(String)
  end
end
