require 'rails_helper'

RSpec.describe "jira_issues/new", type: :view do
  before(:each) do
    assign(:jira_issue, JiraIssue.new(
      jira_issue_id: 1,
      jira_project: nil,
      issue_key: "MyString",
      issue_url: "MyText",
      issue_title: "MyText",
      issue_status: "MyString",
      issue_type: "MyString",
      story_points: 1
    ))
  end

  it "renders new jira_issue form" do
    render

    assert_select "form[action=?][method=?]", jira_issues_path, "post" do

      assert_select "input[name=?]", "jira_issue[jira_issue_id]"

      assert_select "input[name=?]", "jira_issue[jira_project_id]"

      assert_select "input[name=?]", "jira_issue[issue_key]"

      assert_select "textarea[name=?]", "jira_issue[issue_url]"

      assert_select "textarea[name=?]", "jira_issue[issue_title]"

      assert_select "input[name=?]", "jira_issue[issue_status]"

      assert_select "input[name=?]", "jira_issue[issue_type]"

      assert_select "input[name=?]", "jira_issue[story_points]"
    end
  end
end
