class Api::V1::CommentsController < ApplicationController
  before_action :authorize_access_request!

  def create
    comment = authorize current_task.comments.new(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment).serialized_json, status: :created
    else
      entity_error(:unprocessable_entity, comment.errors)
    end
  end

  def destroy
    current_user.comments.find(params[:id]).destroy
    head :no_content
  end

  def comment_params
    params.permit(:body)
  end
end
