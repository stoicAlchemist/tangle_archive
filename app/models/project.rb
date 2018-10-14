class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  belongs_to :domain
  belongs_to :creator, class_name: 'User'
  belongs_to :project_type, optional: true
end
