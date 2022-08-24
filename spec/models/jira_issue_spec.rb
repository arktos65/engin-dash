require 'rails_helper'

RSpec.describe JiraIssue, type: :model do
  # Create data object for testing
  test_issue = FactoryBot.create(:jira_issue)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_issue).to be_valid
  end
  it "is not valid without a Jira issue id" do
    test_issue.jira_issue_id = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without a Jira key" do
    test_issue.issue_key = nil
    expect(test_issue).to_not be_valid
  end
  it "is not valid without a Jira issue title" do
    test_issue.issue_title = nil
    expect(test_issue).to_not be_valid
  end
end
