class ApplicationController < ActionController::API
  include Pundit
  include JWTSessions::RailsAuthorization
  include ErrorHandler

  def docs
    render file: '/public/docs/v1.html'
  end

  def current_project
    @current_project ||= current_user.projects.find(params[:id])
  end

  def current_task
    @current_task ||= current_user.tasks.find(params[:id])
  end

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
