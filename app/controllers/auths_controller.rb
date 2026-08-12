class AuthsController < ApplicationController
  include JsonWebToken

  def login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      user_token = JsonWebToken.encode(user_id: user.id)
      render json: {token: user_token, data: {email: user.email, role: user.role}, status: 200}
    else
      render json: {message: "User not found", status: 404}
    end
  end

  def signup
    user = User.create!(name: params[:user][:name],email: params[:user][:email], password: params[:user][:password], role: params[:user][:role])

    if user.save
      render json: {data: user}
    else
      render json: {error: user.errors.full_messages}
    end
  end

  def user_params
    params.require(:user).permit(:user, :password, :name, :role)
  end
end