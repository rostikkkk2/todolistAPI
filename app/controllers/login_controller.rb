class LoginController < ApplicationController
  # before_action :authorize_refresh_by_access_request!
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      auth_token = encode({ user_id: user.id })
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Login Unsuccessfull' }, status: :unauthorized
    end
  end

  def encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def destroy
  end
end
