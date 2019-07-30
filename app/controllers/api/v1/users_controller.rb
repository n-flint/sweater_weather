class Api::V1::UsersController < ApplicationController


  def create
    facade = UserFacade.new(user_params)
    render json: UserSerializer.new(facade), status: 201
  end


  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
