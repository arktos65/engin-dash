# frozen_string_literal: true

class JiraIssue < ApplicationRecord
  # Associations
  belongs_to :jira_project

  # Validators
  validates_presence_of :jira_issue_id, :issue_key, :issue_title
  validates_presence_of :jira_project
end
