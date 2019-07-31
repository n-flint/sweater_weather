require 'rails_helper'

RSpec.describe 'Roadtrip Service' do
    it 'retrieves the weather based on coordinates' do
      VCR.use_cassette('roadtrip_service') do
        service = RoadtripService.new("Denver,CO", "Pueblo,CO")

        expect(service.destination_coords['lat']).to be_a(Float)
        expect(service.destination_coords['lng']).to be_a(Float)
        expect(service.duration['text']).to be_a(String)
        expect(service.duration['value']).to be_a(Integer)
    end
  end
end