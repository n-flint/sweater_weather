class Api::V1::BackgroundController < ApplicationController


  def show
    location = params['location']
    forecast = ForecastFacade.new(location)
    render json: BackgroundSerializer.new(forecast)
  end
end