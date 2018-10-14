class AddEffortToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :effort, default: 1, foreign_key: true
  end
end
