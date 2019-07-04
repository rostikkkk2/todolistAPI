class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body, :photo

  belongs_to :task
end
