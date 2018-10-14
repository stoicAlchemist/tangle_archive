class Domain < ApplicationRecord

  has_many :projects
  has_many :comments, as: :commentable
  belongs_to :creator, class_name: 'User'

end
