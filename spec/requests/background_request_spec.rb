require 'rails_helper'

RSpec.describe 'Background Image Request', type: :request do
  it 'can retrieve a background image for a city' do
    VCR.use_cassette('background') do

      get '/api/v1/backgrounds?location=denver,co'

      background_data = JSON.parse(response.body)

      expect(response.code).to eq('200')
      expect(background_data).to have_key('data')
      expect(background_data['data']['attributes']).to have_key('image')
      expect(background_data['data']['attributes']).to have_key('link')
    end
  end
end

