FactoryBot.define do
  factory :jira_project do
    project { nil }
    jira_project_id { 1 }
    name { "MyText" }
    jira_key { "MyString" }
    total_issue_count { 1 }
    last_issue_update { "2022-07-21 13:54:02" }
    self_url { "MyText" }
  end
end
