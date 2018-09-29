class AddGoogleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :google_id, :string, null: true
  end
end
