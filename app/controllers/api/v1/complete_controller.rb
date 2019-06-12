class Api::V1::CompleteController < ApplicationController
  before_action :authorize_access_request!

  def update
    current_task.toggle! :complete
    render json: TaskSerializer.new(current_task).serialized_json, status: :ok
  end
end
