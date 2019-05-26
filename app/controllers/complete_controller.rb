class CompleteController < ApplicationController
  before_action :authorize_access_request!

  def update
    task = current_user.tasks.find_by(id: params[:id])
    return render json: {}, status: :not_found unless task

    task.complete? ? task.update(complete: false) : task.update(complete: true)
    render json: task, status: :ok
  end
end
