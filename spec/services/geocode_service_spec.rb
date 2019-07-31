require 'rails_helper'

RSpec.describe 'Geocode Service' do
  it 'returns lat and lng of location params provided' do
    VCR.use_cassette('geocode_service') do
      service = GeocodeService.new("denver,co")

      expect(service.get_coordinates['lat']).to be_a(Float)
      expect(service.get_coordinates['lng']).to be_a(Float)
    end
  end
end