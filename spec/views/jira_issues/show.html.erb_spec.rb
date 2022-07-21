require 'rails_helper'

RSpec.describe "jira_issues/show", type: :view do
  before(:each) do
    @jira_issue = assign(:jira_issue, JiraIssue.create!(
      jira_issue_id: 2,
      jira_project: nil,
      issue_key: "Issue Key",
      issue_url: "MyText",
      issue_title: "MyText",
      issue_status: "Issue Status",
      issue_type: "Issue Type",
      story_points: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Issue Key/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Issue Status/)
    expect(rendered).to match(/Issue Type/)
    expect(rendered).to match(/3/)
  end
end
