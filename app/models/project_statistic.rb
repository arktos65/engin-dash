class ProjectStatistic < ApplicationRecord
  # Associations
  belongs_to :stream
  belongs_to :project

  # Validators
  validates_presence_of :stream, :project
end
