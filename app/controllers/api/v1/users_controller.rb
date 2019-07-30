class Api::V1::UsersController < ApplicationController


  def create
    facade = UserFacade.new(user_params)
    render json: UserSerializer.new(facade)
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
