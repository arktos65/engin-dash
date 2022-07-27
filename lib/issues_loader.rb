# frozen_string_literal: true

require 'jira-ruby'

# Module: IssuesLoader
# Provides an ETL processor for Jira Issues to be imported into the
# jira_issues database table.
module IssuesLoader
  include ProjectConnector

  # Constants required by this module
  MAX_RESULTS = ENGIN_CONFIG["jira"]["max_results"]
  STORY_POINTS = ENGIN_CONFIG["jira"]["fields"]["story_points"]

  # Update project issues by iterating through each project registered
  # in Jira and upserting to the jira_issues table.
  def update_all_issues
    puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Connecting to Jira instance"
    client = JIRA::Client.new(get_options)

    puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Fetching all projects from Jira"
    begin
      jira_projects = client.Project.all
    rescue StandardError => e
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred while fetching Jira projects"
      puts e.message
      return
    end


    # Iterate through projects and upsert each record to database
    i = 0
    while i < jira_projects.count
      page = 0
      item_count = 0
      is_last = false
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Fetching issues for project #{jira_projects[i].name}"
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Upserting Jira issues to EngIn database"
      until is_last
        error_status = false
        begin
          issues = jira_projects[i].issues(startAt: page * MAX_RESULTS, maxResults: MAX_RESULTS)
        rescue StandardError => e
          puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   ERROR: An error occurred while fetching Jira issues"
          puts e.message
          error_status = true
        end
        if issues.count > 0 && !error_status
          jira_project_rec = get_jira_project(jira_projects[i].id)
          upsert_issues(issues, jira_project_rec.id)
          item_count = item_count + issues.count
          page += 1
        else
          is_last = true
        end
      end
      puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Processed #{item_count} issues for project #{jira_projects[i].name}"
      i += 1
    end
  end

  private

  # Locate Jira project record in application database
  def get_jira_project(jira_id)
    JiraProject.find_by(jira_project_id: jira_id)
  end

  # This method upserts a single Jira project issue into the jira_issues
  # database table.
  def upsert_issues(issues, project_id)
    i = 0
    while i < issues.count
      issue = JiraIssue.find_by(jira_issue_id: issues[i].id)
      if issue.nil?
        # Record does not exist, so create it
        issue = JiraIssue.create!(
          jira_issue_id: issues[i].id,
          jira_project_id: project_id,
          issue_key: issues[i].key,
          issue_url: issues[i].self,
          issue_title: issues[i].summary,
          issue_status: issues[i].status,
          issue_type: issues[i].issuetype,
          story_points: issues[i].customfield_10027,
          issue_created: issues[i].created,
          issue_updated: issues[i].updated)
        issue.save
      else
        # Record exists, so update it
        issue.update(
          issue_key: issues[i].key,
          issue_url: issues[i].self,
          issue_title: issues[i].summary,
          issue_status: issues[i].status,
          issue_type: issues[i].issuetype,
          story_points: issues[i].customfield_10027,
          issue_created: issues[i].created,
          issue_updated: issues[i].updated)
      end
      i += 1
    end
  end
end
