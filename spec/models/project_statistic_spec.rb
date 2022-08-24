require 'rails_helper'

RSpec.describe ProjectStatistic, type: :model do
  # Create data object for testing
  test_statistic = FactoryBot.create(:project_statistic)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_statistic).to be_valid
  end
  it "is not valid without an assigned project" do
    test_statistic.project_id = nil
    expect(test_statistic).to_not be_valid
  end
  it "is not valid without a project name" do
    test_statistic.project_name = nil
    expect(test_statistic).to_not be_valid
  end
end
