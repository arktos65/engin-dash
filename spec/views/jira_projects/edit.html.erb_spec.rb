require 'rails_helper'

RSpec.describe "jira_projects/edit", type: :view do
  before(:each) do
    @jira_project = assign(:jira_project, JiraProject.create!(
      project: nil,
      jira_project_id: 1,
      name: "MyText",
      jira_key: "MyString",
      total_issue_count: 1,
      self_url: "MyText"
    ))
  end

  it "renders the edit jira_project form" do
    render

    assert_select "form[action=?][method=?]", jira_project_path(@jira_project), "post" do

      assert_select "input[name=?]", "jira_project[project_id]"

      assert_select "input[name=?]", "jira_project[jira_project_id]"

      assert_select "textarea[name=?]", "jira_project[name]"

      assert_select "input[name=?]", "jira_project[jira_key]"

      assert_select "input[name=?]", "jira_project[total_issue_count]"

      assert_select "textarea[name=?]", "jira_project[self_url]"
    end
  end
end
