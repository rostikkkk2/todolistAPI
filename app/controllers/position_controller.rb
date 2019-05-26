class PositionController < ApplicationController
  before_action :authorize_access_request!

  def update
    service = PositionTaskService.new(current_user, params)
    if service.call
      render json: service.current_task, status: :ok
    else
      render json: {}, status: :not_found
    end
  end
end
