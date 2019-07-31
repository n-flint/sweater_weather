require 'rails_helper'

RSpec.describe 'Flickr Service' do
    it 'retrieves flickr image data based on weather' do
      VCR.use_cassette('flickr_service') do

        service = FlickrService.new("denver,co")

        expect(service.get_image['owner']).to be_a(String)
        expect(service.get_image['secret']).to be_a(String)
        expect(service.get_image['server']).to be_a(String)
        expect(service.get_image['farm']).to be_a(Integer)
        expect(service.get_image['title']).to be_a(String)
    end
  end
end