class AddCreatorToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :creator, foreign_key: {to_table: :users}, null:
      false, default: 1
  end
end
