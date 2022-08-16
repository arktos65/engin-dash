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

  task help: :environment do
    puts "Available actions for loader tasks:"
    puts "- `$ rails loader:help` -- Displays this help text."
    puts "- `$ rails loader:jira_projects` -- Performs an upsert of Jira projects to EngIn database."
    puts "- `$ rails loader:jira_issues` -- Performs an upsert of Jira issues to EngIn database."
    puts "- `$ rails loader:jira_statistics` -- Process weekly Jira data and generate statistics for reporting."
  end
end
