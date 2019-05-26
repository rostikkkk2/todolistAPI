class Comment < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :task

  validates :body, presence: true
end
