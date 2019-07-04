class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :deadline, :complete, :position

  belongs_to :project
  has_many :comments
end
