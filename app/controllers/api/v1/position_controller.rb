class Api::V1::PositionController < ApplicationController
  before_action :authorize_access_request!

  def update
    service = PositionTaskService.new(current_task, params)
    if service.call
      render json: TaskSerializer.new(service.current_task).serialized_json
    else
      exception_error(:unprocessable_entity, service.error)
    end
  end
end
