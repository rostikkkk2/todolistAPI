class ApplicationController < ActionController::API
  include Pundit
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  def docs
    render file: 'public/docs/v1.html'
  end

  private

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
