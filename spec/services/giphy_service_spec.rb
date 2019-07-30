require 'rails_helper'

describe 'Giphy Service' do
  it 'retrieves a giphy url based on weather data' do
    weather_query = 'rainy'

    service = GiphyService.new(weather_query)

    expect(service.get_url).to be_a(String)
  end
end