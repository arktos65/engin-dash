# frozen_string_literal: true

FactoryBot.define do
  factory :jira_project do
    project_id { nil }
    jira_project_id { Faker::Number.between(from: 1000, to: 9000) }
    name { Faker::String.name }
    jira_key { Faker::String.name }
    total_issue_count { Faker::Number.between(from: 1, to: 50) }
    last_issue_update { Faker::Date.backward(days: 2) }
    self_url { Faker::Internet.url }
  end
end
