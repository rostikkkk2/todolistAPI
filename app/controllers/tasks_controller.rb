class TasksController < ApplicationController
  before_action :authorize_access_request!

  def create
    project = current_user.projects.find_by(id: params[:project_id])
    return render json: {}, status: :unprocessable_entity unless project

    task = project.tasks.new(task_params.merge(deadline: Time.now.next_day))
    render json: TaskSerializer.new(task).serialized_json, status: :created if task.save && task.update(position: task.id)
  end

  def update
    task = current_user.tasks.find_by(id: params[:id])
    if task&.update(task_params)
      render json: TaskSerializer.new(task).serialized_json, status: :ok
    else
      render json: {}, status: :not_found
    end
  end

  def destroy
    current_user.tasks.find_by(id: params[:id])&.destroy
    head :no_content
  end

  def task_params
    params.permit(:name, :deadline)
  end
end
