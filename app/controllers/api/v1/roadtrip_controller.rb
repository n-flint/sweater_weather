class Api::V1::RoadtripController < ApplicationController

  def show
    if roadtrip_params['api_key'].length == 20
      User.find_by(api_key: roadtrip_params['api_key'])
      facade = RoadtripFacade.new(roadtrip_params)
      render json: RoadtripSerializer.new(facade)
    else
      render status: 404, json: {
        error: 'Invalid Api Key'
      }
    end
  end

  private

  def roadtrip_params
    params.require(:roadtrip).permit(:origin, :destination, :api_key)
  end
end