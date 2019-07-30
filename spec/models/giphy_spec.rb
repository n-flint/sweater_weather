require 'rails_helper'

RSpec.describe Giphy, type: :model do
  it 'has attributes' do
    day_data = {
        "time"=>1564466400,
        "summary"=>"Foggy in the morning.",
        "icon"=>"fog",
        "precipProbability"=>0.04,
        "precipType"=>"rain",
        "temperatureHigh"=>95.92,
        "temperatureLow"=>68.72
      }
    day = DailyWeather.new(day_data)
    url = "https://media0.giphy.com/media/AIGF7ljcNKZI4/giphy.gif?cid=82daf0645d406bfc5a496c5567dc2c8b&rid=giphy.gif"

    giphy = Giphy.new(day, url)

    expect(giphy.time).to eq('1564466400')
    expect(giphy.summary).to eq("Foggy in the morning.")
    expect(giphy.url).to eq(url)
  end
end
