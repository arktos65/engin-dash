require 'rails_helper'

RSpec.describe "jira_projects/index", type: :view do
  before(:each) do
    assign(:jira_projects, [
      JiraProject.create!(
        project: nil,
        jira_project_id: 2,
        name: "MyText",
        jira_key: "Jira Key",
        total_issue_count: 3,
        self_url: "MyText"
      ),
      JiraProject.create!(
        project: nil,
        jira_project_id: 2,
        name: "MyText",
        jira_key: "Jira Key",
        total_issue_count: 3,
        self_url: "MyText"
      )
    ])
  end

  it "renders a list of jira_projects" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Jira Key".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
