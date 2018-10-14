class Effort < ApplicationRecord
  has_many :tasks
  before_destroy :unlink_efforts

  private

  def unlink_efforts
    Task.where(effort_id: id).update_all(effort_id: Effort.where(name: 'NoEffort'))
  end

end
