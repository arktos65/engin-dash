# frozen_string_literal: true

class Stream < ApplicationRecord
  # Associations
  has_many :projects
  has_many :project_statistics

  # Validators
  validates_presence_of :name
end
