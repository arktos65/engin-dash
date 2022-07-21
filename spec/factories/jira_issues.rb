# frozen_string_literal: true

FactoryBot.define do
  factory :jira_issue do
    jira_issue_id { Faker::Number.between(from: 1000, to: 9000) }
    jira_project_id { nil }
    issue_key { Faker::String.random(length: 3) + jira_issue_id.to_s }
    issue_url { Faker::Internet.url }
    issue_title { Faker::Lorem.words(number: 5) }
    issue_status { 'Open' }
    issue_type { 'Story' }
    story_points { Faker::Number.between(from: 1, to: 5) }
    issue_created { '2022-07-05 11:38:38' }
    issue_updated { '2022-07-05 11:38:38' }
  end
end
