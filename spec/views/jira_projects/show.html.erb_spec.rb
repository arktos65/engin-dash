require 'rails_helper'

RSpec.describe "jira_projects/show", type: :view do
  before(:each) do
    @jira_project = assign(:jira_project, JiraProject.create!(
      project: nil,
      jira_project_id: 2,
      name: "MyText",
      jira_key: "Jira Key",
      total_issue_count: 3,
      self_url: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Jira Key/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
