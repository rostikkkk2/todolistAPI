module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authorize_access_request!

      def create
        project = authorize current_user.projects.new(project_params)
        if project.save
          render json: ProjectSerializer.new(project).serialized_json, status: :created
        else
          render json: {}, status: :unprocessable_entity
        end
      end

      def update
        project = current_user.projects.find_by(id: params[:id])
        return render json: {}, status: :not_found unless project

        project.update(name: params[:name])
        render json: ProjectSerializer.new(project).serialized_json, status: :ok
      end

      def destroy
        authorize current_user.projects.find_by(id: params[:id])&.destroy
        head :no_content
      end

      private

      def project_params
        params.permit(:name)
      end
    end
  end
end
