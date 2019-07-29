class Api::V1::ForecastController < ApplicationController


  def show
    location = params['location']
    forecast = ForecastFacade.new(location)
    # render json: ForecastSerializer.new(forecast)
    require 'pry'; binding.pry
  end
end