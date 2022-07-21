FactoryBot.define do
  factory :jira_issue do
    jira_issue_id { 1 }
    jira_project { nil }
    issue_key { "MyString" }
    issue_url { "MyText" }
    issue_title { "MyText" }
    issue_status { "MyString" }
    issue_type { "MyString" }
    story_points { 1 }
    issue_created { "2022-07-21 14:00:50" }
    issue_updated { "2022-07-21 14:00:50" }
  end
end
