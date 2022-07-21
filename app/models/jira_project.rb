# frozen_string_literal: true

class JiraProject < ApplicationRecord
  # Associations
  belongs_to :project
  has_many :jira_issues

  # Validators
  validates_presence_of :name, :jira_key, :self_url
  validates_presence_of :project
end
