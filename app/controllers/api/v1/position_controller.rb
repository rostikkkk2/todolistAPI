class Api::V1::PositionController < ApplicationController
  before_action :authorize_access_request!

  def update
    service = PositionTaskService.new(current_task, params)
    render json: TaskSerializer.new(service.current_task).serialized_json, status: :ok if service.call
  end
end
