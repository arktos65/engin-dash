require 'rails_helper'

RSpec.describe Role, type: :model do
  # Create data objects for testing
  test_user = FactoryBot.create(:user)
  test_department = FactoryBot.create(:department, user_id: test_user.id)
  test_role = FactoryBot.create(:role, department_id: test_department.id)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_role).to be_valid
  end
  it "is not valid without a department" do
    test_role.department_id = nil
    expect(test_role).to_not be_valid
  end
  it "is not valid without a role name" do
    test_role.name = nil
    expect(test_role).to_not be_valid
  end
end
