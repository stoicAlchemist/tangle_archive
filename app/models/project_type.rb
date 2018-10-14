class ProjectType < ApplicationRecord
  has_many :projects
  before_destroy :unlink_project_type

  private

  def unlink_project_type
    Project.where(project_type_id: id)
      .update_all(project_type_id: ProjectType.where(name: 'NoType').first.id)
  end
end
