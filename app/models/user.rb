class User < ApplicationRecord
  has_many :tasks, as: :creator
  has_many :domains, as: :creator
  has_many :projects, as: :creator
  has_many :comments, as: :creator
end
