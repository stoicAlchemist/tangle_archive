class AddCreatorToDomains < ActiveRecord::Migration[5.1]
  def change
    add_reference :domains, :creator, foreign_key: {to_table: :users},
      null: false, default: 1
  end
end
