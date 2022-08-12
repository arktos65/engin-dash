require 'rails_helper'

RSpec.describe Member, type: :model do
  # Create data objects to be tested
  test_user = FactoryBot.create(:user)
  test_department = FactoryBot.create(:department, user_id: test_user.id)
  test_source = FactoryBot.create(:source)
  test_role = FactoryBot.create(:role, department_id: test_department.id)
  test_member = FactoryBot.create(:member, role_id: test_role.id,
                                  department_id: test_department.id,
                                  source_id: test_source.id)

  # Test various conditions
  it "is valid with valid attributes" do
    expect(test_member).to be_valid
  end
  it "is not valid without first name" do
    test_member.first_name = nil
    expect(test_member).to_not be_valid
  end
  it "is not valid without last name" do
    test_member.last_name = nil
    expect(test_member).to_not be_valid
  end
  it "is not valid without an assigned role" do
    test_member.role_id = nil
    expect(test_member).to_not be_valid
  end
  it "is not valid without an assigned department" do
    test_member.department_id = nil
    expect(test_member).to_not be_valid
  end
  it "is not valid without an assigned source" do
    test_member.source_id = nil
    expect(test_member).to_not be_valid
  end
end
