require 'rails_helper'

RSpec.describe 'Flickr Service' do
    it 'retrieves flickr image data based on weather' do
      VCR.use_cassette('flickr_service') do

        service = FlickrService.new("denver,co")

        expect(service.image_data['owner']).to be_a(String)
        expect(service.image_data['secret']).to be_a(String)
        expect(service.image_data['server']).to be_a(String)
        expect(service.image_data['farm']).to be_a(Integer)
        expect(service.image_data['title']).to be_a(String)
    end
  end
end