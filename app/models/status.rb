class Status < ApplicationRecord
  has_many :tasks
  before_destroy :unlink_status

  private

  def unlink_status
    Task.where(status_id: id)
      .update_all(status_id: Status.where(name: 'NoStatus').first.id)
  end
end
