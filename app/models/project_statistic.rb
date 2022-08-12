class ProjectStatistic < ApplicationRecord
  # Associations
  belongs_to :project

  # Validators
  validates_presence_of :project, :project_name
end
