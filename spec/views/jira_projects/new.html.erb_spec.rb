require 'rails_helper'

RSpec.describe "jira_projects/new", type: :view do
  before(:each) do
    assign(:jira_project, JiraProject.new(
      project: nil,
      jira_project_id: 1,
      name: "MyText",
      jira_key: "MyString",
      total_issue_count: 1,
      self_url: "MyText"
    ))
  end

  it "renders new jira_project form" do
    render

    assert_select "form[action=?][method=?]", jira_projects_path, "post" do

      assert_select "input[name=?]", "jira_project[project_id]"

      assert_select "input[name=?]", "jira_project[jira_project_id]"

      assert_select "textarea[name=?]", "jira_project[name]"

      assert_select "input[name=?]", "jira_project[jira_key]"

      assert_select "input[name=?]", "jira_project[total_issue_count]"

      assert_select "textarea[name=?]", "jira_project[self_url]"
    end
  end
end
