class User < ApplicationRecord
  has_many :created_tasks, foreign_key: :creator_id, class_name: 'Task'
  has_many :domains, foreign_key: :creator_id
  has_many :projects, foreign_key: :creator_id
  has_many :comments, foreign_key: :creator_id

  # Filters
  before_save :lowcase_properties
  before_destroy :unlink_user


  validates_presence_of :email, :username, :password_digest

  has_secure_password

  private

  def lowcase_properties

    @email    = email.downcase!
    @username = username.downcase!

  end

  def unlink_user
    # List only the has_many relations where the user is a creator
    creations = %w[ task comment domain project ]
    creations.each do |creation|
      creation.capitalize.constantize.where(creator_id: id)
        .update_all(creator_id: User.where(username: 'anonymous').first.id)
    end
  end

end
