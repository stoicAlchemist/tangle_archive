class Task < ApplicationRecord
  belongs_to :status
  belongs_to :effort
  belongs_to :project

  belongs_to :parent, class_name: "Task", optional: true

  has_many :comments, as: :commentable

  default_scope { order(priority: :desc) }

  validates :title, presence: true
end
