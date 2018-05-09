class RemoveDoneFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :done
  end
end
