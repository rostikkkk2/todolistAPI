class SessionController < ApplicationController
  before_action :authorize_access_request!, only: :destroy
  before_action :authorize_refresh_by_access_request!, only: :update

  def create
    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      session = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true)
      render json: session.login, status: :ok
    else
      render json: 'Invalid user', status: :unauthorized
    end
  end

  def destroy
    JWTSessions::Session.new(payload: payload).flush_by_access_payload
    render json: :ok
  end
end
