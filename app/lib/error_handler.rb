module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_error
  end

  def not_found_error
    exception_error(:not_found, I18n.t('statuses.not_found'))
  end

  def exception_error(status, errors)
    service = ExceptionErrorService.new(request.path, errors)
    render json: ErrorSerializer.new(service), status: status
  end

  def entity_error(status, errors)
    service = EntityErrorService.new(status, errors)
    render json: ErrorSerializer.new(service), status: status
  end

  def not_authorized
    render json: { error: I18n.t('statuses.not_authorized') }, status: :unauthorized
  end
end
