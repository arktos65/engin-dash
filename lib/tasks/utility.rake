namespace :utility do
  desc "EngIn application utilities"
  task clear_jira_issues: :environment do
    include EnginUtility
    destroy_jira_issues
  end

  task clear_jira_projects: :environment do
    include EnginUtility
    destroy_jira_projects
  end

  task clear_statistics: :environment do
    include EnginUtility
    destroy_statistics
  end
end
