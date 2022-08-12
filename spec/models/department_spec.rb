require 'rails_helper'

RSpec.describe Department, type: :model do
  # Create test data objects
  test_user = FactoryBot.create(:user)
  test_department = FactoryBot.create(:department, user_id: test_user.id)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_department).to be_valid
  end
  it "is not valid without department name" do
    test_department.name = nil
    expect(test_department).to_not be_valid
  end
  it "is not valid without an assigned manager" do
    test_department.user_id = nil
    expect(test_department).to_not be_valid
  end
end
