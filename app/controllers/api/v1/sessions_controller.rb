class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      jwt = JWT.encode payload, ENV['secret'], 'HS256'
      render json: UserSerializer.new(user), meta: jwt, meta_key: 'jwt'
    else
      error = 'Email or password invalid. Please try again.'
      render json: ErrorSerializer.new(error), status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
