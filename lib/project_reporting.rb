# frozen_string_literal: true

# Module: ProjectReporting
# This processor should be run on a weekly basis.  It will summarize the data in the `jira_issues` table
# by project and compile statistics by week, month, year for visualization, analysis, and reporting.
module ProjectReporting
  include ProjectConnector

  # This method is the primary method to be called for processing Jira project issues
  # and calculating project statistics.
  def process_jira_issues
    # Get the week, month, and year numbers for our statistics
    week_number = Time.now.strftime("%U").to_i
    month_number = Time.now.month
    year_number = Time.now.year

    # Query the projects table for records where is_trackable is true
    puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Starting Jira issue processing for week #{week_number} of year #{year_number}"
    # Begin iterating through the projects to compute results
    Project.all.each do |project|
      if project.is_trackable
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Processing project #{project.name}"
        calculate_statistics(project.stream_id, project.id, project.name, week_number, month_number, year_number)
      else
        puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Skipping project #{project.name}"
      end
    end
    puts "#{Time.now.strftime('%F - %H:%M:%S.%L')}:   Finished processing Jira project issues"
  end

  #private

  # Returns the name of the requested stream id.
  def get_stream_name(stream_id)
    stream = Stream.find_by(id: stream_id)
    stream.name
  end

  # Main method for processing Jira Issues and tabulating statistics
  def calculate_statistics(stream_id, project_id, project_name, week_num, month_num, year_num)
    # Start building the project statistic record
    output_record = ProjectStatistic.new
    output_record.stream_id = stream_id
    output_record.stream_name = get_stream_name(stream_id)
    output_record.project_id = project_id
    output_record.project_name = project_name
    output_record.week_number = week_num
    output_record.month_number = month_num
    output_record.year_number = year_num

    # Calculate ticket counts
    output_record.bug_count = bug_count(project_id)
    output_record.story_count = story_count(project_id)
    output_record.task_count = task_count(project_id)

    # Calculate ticket counts by status
    output_record.open_bugs = open_bugs(project_id)
    output_record.open_stories = open_stories(project_id)
    output_record.open_tasks = open_tasks(project_id)
    output_record.closed_bugs = closed_bugs(project_id)
    output_record.closed_stories = closed_stories(project_id)
    output_record.closed_tasks = closed_tasks(project_id)
    output_record.dropped_bugs = dropped_bugs(project_id)
    output_record.dropped_stories = dropped_stories(project_id)
    output_record.dropped_tasks = dropped_tasks(project_id)

    # Calculate capex and opex story points
    output_record.capex_points = capex_points(project_id)
    output_record.opex_points = opex_points(project_id)

    # Calcuate team cost capex allocation
    output_record.weekly_team_cost = team_cost(project_id)
    output_record.weekly_capex = capex_cost(output_record.capex_points,
                                              output_record.opex_points,
                                              output_record.weekly_team_cost)
    output_record.weekly_opex = opex_cost(output_record.capex_points,
                                            output_record.opex_points,
                                            output_record.weekly_team_cost)
    output_record.save
  end

  # Calculates and returns the aggregate team weekly cost allocation
  # TODO: Add currency support (currently only supports USD)
  def team_cost(project_id)
    total_cost = 0
    Team.where(project_id: project_id).find_each do |person|
      total_cost = total_cost + (person.weekly_rate * (person.allocation / 100))
    end
    total_cost
  end

  # Returns the capex cost allocation
  def capex_cost(capex_pts, opex_pts, team_cost_amt)
    total_points = capex_pts + opex_pts
    capex_alloc = capex_pts / total_points
    team_cost_amt * capex_alloc
  end

  # Returns the opex cost allocation
  def opex_cost(capex_pts, opex_pts, team_cost_amt)
    total_points = capex_pts + opex_pts
    opex_alloc = opex_pts / total_points
    team_cost_amt * opex_alloc
  end

  # Returns total number of capex allocated story points
  def capex_points(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["capex_types"]).
      sum(:story_points)
  end

  # Returns total number of opex allocated story points
  def opex_points(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["opex_types"]).
      sum(:story_points)
  end

  # Returns number of open tickets in specified project
  def open_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["open_status"]).count
  end

  # Returns number of open bug tickets in specified project
  def open_bugs(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["open_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["bug_types"]).count
  end

  # Returns number of open story tickets in specified project
  def open_stories(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["open_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["story_types"]).count
  end

  # Returns number of open task tickets in specified project
  def open_tasks(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["open_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["task_types"]).count
  end

  # Returns number of closed bug tickets in specified project
  def closed_bugs(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["closed_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["bug_types"]).count
  end

  # Returns number of closed story tickets in specified project
  def closed_stories(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["closed_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["story_types"]).count
  end

  # Returns number of closed task tickets in specified project
  def closed_tasks(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["closed_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["task_types"]).count
  end

  # Returns number of dropped bug tickets in specified project
  def dropped_bugs(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["dropped_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["bug_types"]).count
  end

  # Returns number of dropped story tickets in specified project
  def dropped_stories(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["dropped_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["story_types"]).count
  end

  # Returns number of dropped task tickets in specified project
  def dropped_tasks(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["dropped_status"]).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["task_types"]).count
  end

  # Returns number of closed tickets in specified project
  def closed_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["closed_status"]).count
  end

  # Returns number of dropped tickets in specified project
  def dropped_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_status IN (?)', ENGIN_CONFIG["jira"]["dropped_status"]).count
  end

  # Returns the number of bug tickets in specified project
  def bug_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["bug_types"]).count
  end

  # Returns the number of story tickets in specified project
  def story_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["story_types"]).count
  end

  # Returns the number of task tickets in specified project
  def task_count(project_id)
    JiraIssue.where('jira_project_id = ?', project_id).
      where('issue_type IN (?)', ENGIN_CONFIG["jira"]["task_types"]).count
  end
end
