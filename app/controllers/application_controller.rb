class ApplicationController < ActionController::API
  include Pundit
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def docs
    render file: 'public/docs/v1.html'
  end

  def current_project
    @current_project ||= current_user.projects.find(params[:id])
  end

  def current_task
    @current_task ||= current_user.tasks.find(params[:id])
  end

  def not_found_error
    service = ExceptionErrorService.new(request.path, 'Not found')
    render json: ErrorSerializer.new(service), status: :not_found
  end

  def entity_error(status, errors)
    service = EntityErrorService.new(status, errors)
    render json: ErrorSerializer.new(service), status: status
  end

  private

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end
end
