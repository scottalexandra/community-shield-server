class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      error = 'Email or password invalid. Please try again.'
      render json: ErrorSerializer.new(error), status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
