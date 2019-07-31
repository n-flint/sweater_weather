require 'rails_helper'

describe 'Darksky Service' do
  it 'retrieves the weather based on coordinates' do
    VCR.use_cassette('weather_service') do

      coordinates = {
          "lat"=>39.7392358,
          "lng"=>-104.990251
        }

      service = DarkskyService.new(coordinates)

      expect(service.get_weather).to be_a(Hash)
      expect(service.get_weather).to have_key('currently')
      expect(service.get_weather).to have_key('hourly')
      expect(service.get_weather).to have_key('daily')
      expect(service.get_weather['latitude']).to eq(39.7392358)
      expect(service.get_weather['longitude']).to eq(-104.990251)
      end
  end
end 