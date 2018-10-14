class AddIconToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :icon, :string, null: false, default: 'folder'
  end
end
