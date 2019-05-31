module Api
  module V1
    class CompleteController < ApplicationController
      before_action :authorize_access_request!

      def update
        task = current_user.tasks.find_by(id: params[:id])
        return render json: {}, status: :not_found unless task

        task.complete? ? task.update(complete: false) : task.update(complete: true)
        render json: TaskSerializer.new(task).serialized_json, status: :ok
      end
    end
  end
end
