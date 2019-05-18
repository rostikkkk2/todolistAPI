class ProjectsController < ApplicationController
  before_action :authorize_access_request!

  def create
    project = current_user.projects.new(project_params)
    if project.save
      render json: project, status: :created
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def update
    project = Project.find_by(id: params[:id].to_i)
    return render json: { error: 'error' }, status: :not_found unless project

    project.update(name: params[:name])
    render json: project, status: :ok
  end

  def destroy
    project = Project.find_by(id: params[:id].to_i)
    if project&.delete
      head :no_content
    else
      render json: { error: 'error' }, status: :not_found
    end
  end

  private

  def project_params
    params.permit(:name)
  end
end
