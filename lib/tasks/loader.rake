namespace :loader do
  desc "Update Jira tables from API"
  task jira_projects: :environment do
    include ProjectsLoader
    update_all_projects
  end

  task jira_issues: :environment do
    include IssuesLoader
    update_all_issues
  end

  task jira_statistics: :environment do
    include ProjectReporting
    process_jira_issues
  end
end
