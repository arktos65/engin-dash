require 'rails_helper'

RSpec.describe JiraProject, type: :model do
  # Create data object for testing
  test_jira = FactoryBot.create(:jira_project)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_jira).to be_valid
  end
  it "is not valid without a project name" do
    test_jira.name = nil
    expect(test_jira).to_not be_valid
  end
  it "is not valid without a Jira key value" do
    test_jira.jira_key = nil
    expect(test_jira).to_not be_valid
  end
  it "is not valid without a Jira self URL" do
    test_jira.self_url = nil
    expect(test_jira).to_not be_valid
  end
end
