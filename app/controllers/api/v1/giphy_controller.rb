class Api::V1::GiphyController < ApplicationController

  def index
    location = params['location']
    facade = GiphyFacade.new(params['location'])
    render json: GiphySerializer.new(facade)
  end
end 