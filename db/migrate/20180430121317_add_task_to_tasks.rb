class AddTaskToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :parent, foreign_key: {to_table: :tasks}, null: true
  end
end
