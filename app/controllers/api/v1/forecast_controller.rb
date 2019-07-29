class Api::V1::ForecastController < ApplicationController


  def show
    location = params['location']
    forecast = ForecastFacade.new(location)
    # require 'pry'; binding.pry
    render json: ForecastSerializer.new(forecast.weather)
    # require 'pry'; binding.pry
  end
end