class AddDomainToProjects < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :domain, null: true
  end
end
