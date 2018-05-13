class Project < ApplicationRecord
  has_many :tasks
  belongs_to :domain
  belongs_to :creator, class_name: 'User'
end
