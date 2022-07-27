FactoryBot.define do
  factory :project_statistic do
    stream { nil }
    stream_name { "MyText" }
    project { nil }
    project_name { "MyString" }
    week_number { 1 }
    month_number { 1 }
    year_number { 1 }
    bug_count { 1 }
    story_count { 1 }
    task_count { 1 }
    team_count { 1 }
    open_bugs { 1 }
    open_stories { 1 }
    open_tasks { 1 }
    closed_bugs { 1 }
    closed_stories { 1 }
    closed_tasks { 1 }
    capex_points { 1 }
    opex_points { 1 }
    weekly_team_cost { "9.99" }
    weekly_capex { "9.99" }
    weekly_opex { "9.99" }
  end
end
