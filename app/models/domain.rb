class Domain < ApplicationRecord

  has_many :projects
  has_many :comments, as: :commentable

end
