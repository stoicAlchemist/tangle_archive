class AddBootstrapColorToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :bootstrap_color, :string, default: 'secondary',
      null:false
  end
end
