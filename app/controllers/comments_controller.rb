class CommentsController < ApplicationController
  before_action :authorize_access_request!

  def create
    task = current_user.tasks.find_by(id: params[:task_id])
    comment = task&.comments&.new(comment_params)
    if comment&.save
      render json: CommentSerializer.new(comment).serialized_json, status: :created
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.comments.find_by(id: params[:id])&.destroy
    head :no_content
  end

  def comment_params
    params.permit(:body)
  end
end
