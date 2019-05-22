class TasksController < ApplicationController
  before_action :authorize_access_request!

  def create
    project = current_user.projects.find_by(id: params[:project_id])
    return render json: {}, status: :unprocessable_entity unless project

    task = project.tasks.new(task_params)
    render json: task, status: :created if task.save
  end

  def update
    task = current_user.tasks.find_by(id: params[:id])
    if task&.update(name: params[:name])
      render json: task, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.tasks.find_by(id: params[:id])&.destroy
    head :no_content
  end

  def task_params
    params.permit(:name, :project_id)
  end
end
