require 'rails_helper'

RSpec.describe FlickrImage do
  before :each do
    image_data = {
      'owner' => 1564543324,
      'secret' => "Mostly Cloudy",
      'server' => "partly-cloudy-night",
      'farm' => 77.86,
      'title' => 0.12
    }
    @image = FlickrImage.new(image_data)
  end
  it 'exists' do
    expect(@image.class).to eq(FlickrImage)
  end

  it 'has attributes' do
    expect(@image.image_data).to be_a(Hash)
  end
end