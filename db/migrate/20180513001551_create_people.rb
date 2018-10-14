class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name, null: false, unique: true
      t.string :role, null: false, default: 'Undefined'

      t.timestamps
    end
  end
end
