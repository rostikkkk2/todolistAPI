class ProjectsController < ApplicationController
  before_action :authorize_access_request!

  def create
    # p user = User.find(payload['us  er_id'])
    # p payload
    p 22222222222222222
    p current_user
    # p session

    # project = current_user.projects.new(project_params)
    # p project
    # project.save!
    # render json: ProjectSerializer.new(project).serialized_json, status: :created
  end

  # def update
  #
  # end
  #
  # def destroy
  #
  # end

  private

  def project_params
    params.permit(:name)
  end
end
