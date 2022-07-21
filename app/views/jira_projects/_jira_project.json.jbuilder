json.extract! jira_project, :id, :project_id, :jira_project_id, :name, :jira_key, :total_issue_count, :last_issue_update, :self_url, :created_at, :updated_at
json.url jira_project_url(jira_project, format: :json)
