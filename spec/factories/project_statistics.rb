FactoryBot.define do
  factory :project_statistic do
    project_id { nil }
    project_name { "MyString" }
    week_number { Faker::Number.between(from: 1, to: 52) }
    month_number { Faker::Number.between(from: 1, to: 12) }
    year_number { DateTime.now.year }
    bug_count { Faker::Number.between(from: 0, to: 100) }
    story_count { Faker::Number.between(from: 0, to: 100) }
    task_count { Faker::Number.between(from: 0, to: 100) }
    team_count { Faker::Number.between(from: 1, to: 8) }
    open_bugs { Faker::Number.between(from: 0, to: 30) }
    open_stories { Faker::Number.between(from: 0, to: 30) }
    open_tasks { Faker::Number.between(from: 0, to: 30) }
    closed_bugs { Faker::Number.between(from: 0, to: 40) }
    closed_stories { Faker::Number.between(from: 0, to: 40) }
    closed_tasks { Faker::Number.between(from: 0, to: 40) }
    capex_points { Faker::Number.between(from: 1, to: 500) }
    opex_points { Faker::Number.between(from: 1, to: 500) }
    weekly_team_cost { 2500 }
    weekly_capex { 2000 }
    weekly_opex { 500 }
  end
end
