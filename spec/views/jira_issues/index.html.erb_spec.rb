require 'rails_helper'

RSpec.describe "jira_issues/index", type: :view do
  before(:each) do
    assign(:jira_issues, [
      JiraIssue.create!(
        jira_issue_id: 2,
        jira_project: nil,
        issue_key: "Issue Key",
        issue_url: "MyText",
        issue_title: "MyText",
        issue_status: "Issue Status",
        issue_type: "Issue Type",
        story_points: 3
      ),
      JiraIssue.create!(
        jira_issue_id: 2,
        jira_project: nil,
        issue_key: "Issue Key",
        issue_url: "MyText",
        issue_title: "MyText",
        issue_status: "Issue Status",
        issue_type: "Issue Type",
        story_points: 3
      )
    ])
  end

  it "renders a list of jira_issues" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Issue Key".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Issue Status".to_s, count: 2
    assert_select "tr>td", text: "Issue Type".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
