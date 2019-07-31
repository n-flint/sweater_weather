class Api::V1::SessionsController < ApplicationController


  def create
    facade = SessionsFacade.new(session_params)
    if facade.authenticated_user
      session[:user_id] = facade.user_id
      render json: SessionsSerializer.new(facade)
    else
      render status: 404, json: {
        error: 'User Not Found'
      }
    end
  end


  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end