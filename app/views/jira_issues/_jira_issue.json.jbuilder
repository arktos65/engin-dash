json.extract! jira_issue, :id, :jira_issue_id, :jira_project_id, :issue_key, :issue_url, :issue_title, :issue_status, :issue_type, :story_points, :issue_created, :issue_updated, :created_at, :updated_at
json.url jira_issue_url(jira_issue, format: :json)
