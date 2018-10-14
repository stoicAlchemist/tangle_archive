class RemoveColumnGoogleIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :google_id
  end
end
