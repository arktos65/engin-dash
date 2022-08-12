require 'rails_helper'

RSpec.describe Team, type: :model do
  # Create data objects to be tested
  test_currency = FactoryBot.create(:currency)
  test_user = FactoryBot.create(:user)
  test_department = FactoryBot.create(:department, user_id: test_user.id)
  test_source = FactoryBot.create(:source)
  test_role = FactoryBot.create(:role, department_id: test_department.id)
  test_member = FactoryBot.create(:member, role_id: test_role.id,
                                  department_id: test_department.id,
                                  source_id: test_source.id)
  test_stream = FactoryBot.create(:stream)
  test_project = FactoryBot.create(:project, stream_id: test_stream.id)
  test_team = FactoryBot.create(:team, member_id: test_member.id,
                                project_id: test_project.id,
                                currency_id: test_currency.id)

  # Test various conditions
  context 'validating presence of' do
    it "is valid with valid attributes" do
      expect(test_team).to be_valid
    end
    it "is not valid without an annual rate" do
      test_team.annual_rate = nil
      expect(test_team).to_not be_valid
    end
  end

  context 'validating associations with other entities' do
    it "is not valid without an associated project" do
      test_team.project_id = nil
      expect(test_team).to_not be_valid
    end
    it "is not valid with an associated member" do
      test_team.member_id = nil
      expect(test_team).to_not be_valid
    end
    it "is not valid without an associated currency" do
      test_team.currency_id = nil
      expect(test_team).to_not be_valid
    end
  end

  context 'validating data types and value ranges' do
    it "must have an allocation greater than or equal to zero" do
      test_team.allocation = -5
      expect(test_team).to_not be_valid
    end
    it "must have an allocation less than or equal to 100" do
      test_team.allocation = 105
      expect(test_team).to_not be_valid
    end
  end
end
