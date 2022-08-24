require 'rails_helper'

RSpec.describe Member, type: :model do
  # Create data objects to be tested
  test_member = FactoryBot.create(:member)

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
