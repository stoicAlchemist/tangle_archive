class AddDoneToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :done, :boolean, default: false, null: false
  end
end
