# frozen_string_literal: true

class Project < ApplicationRecord
  # Associations
  belongs_to :stream
  has_many :project_statistics
end
