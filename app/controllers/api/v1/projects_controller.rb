class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_access_request!

  def create
    project = authorize current_user.projects.new(project_params)
    if project.save
      render json: ProjectSerializer.new(project).serialized_json, status: :created
    else
      entity_error(:unprocessable_entity, project.errors)
    end
  end

  def update
    if current_project.update(project_params)
      render json: ProjectSerializer.new(current_project).serialized_json, status: :ok
    else
      entity_error(:unprocessable_entity, current_project.errors)
    end
  end

  def destroy
    authorize current_project.destroy
    head :no_content
  end

  private

  def project_params
    params.permit(:name)
  end
end
