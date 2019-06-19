class Api::V1::TasksController < ApplicationController
  before_action :authorize_access_request!

  def create
    task = current_project.tasks.new(task_params)
    if task.save
      render json: TaskSerializer.new(task).serialized_json, status: :created
    else
      entity_error(:unprocessable_entity, task.errors)
    end
  end

  def update
    if current_task.update(task_params)
      render json: TaskSerializer.new(current_task).serialized_json
    else
      entity_error(:unprocessable_entity, current_task.errors)
    end
  end

  def destroy
    current_task.destroy
    head :no_content
  end

  def task_params
    params.permit(:name, :deadline)
  end
end
