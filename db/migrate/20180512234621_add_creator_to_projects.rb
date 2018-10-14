class AddCreatorToProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :creator, foreign_key: {to_table: :users},
      null: false, default: 1
  end
end
