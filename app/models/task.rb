class Task < ApplicationRecord
  belongs_to :status
  belongs_to :effort
  belongs_to :project

  belongs_to :parent, class_name: "Task", optional: true

  has_many :comments, as: :commentable

  validates :title, presence: true
end
