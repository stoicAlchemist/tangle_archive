class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.boolean :hidden, default: false
      t.boolean :flagged, default: false

      t.timestamps
    end
  end
end
