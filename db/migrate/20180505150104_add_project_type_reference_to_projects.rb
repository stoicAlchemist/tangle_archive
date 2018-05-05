class AddProjectTypeReferenceToProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :project_type, foreign_key: true, null: false, default: 1
  end
end
