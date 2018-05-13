class Task < ApplicationRecord
  belongs_to :status
  belongs_to :effort
  belongs_to :project, optional: true
  belongs_to :creator, class_name: 'User'

  belongs_to :parent, class_name: 'Task', optional: true

  has_many :comments, as: :commentable

  default_scope { order(priority: :desc) }

  validates :title, presence: true
end
