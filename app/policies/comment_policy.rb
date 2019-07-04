class CommentPolicy < ApplicationPolicy
  def belongs_to_user?
    @user.comments.where(id: @record.id).exists?
  end
end
