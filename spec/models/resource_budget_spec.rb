require 'rails_helper'

RSpec.describe ResourceBudget, type: :model do
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
  test_budget = FactoryBot.create(:resource_budget, member_id: test_member.id,
                                  currency_id: test_currency.id)

  # Test the various conditions
  context 'validating presence of' do
    it 'is valid with valid attributes' do
      expect(test_budget).to be_valid
    end
    it 'is not valid without a base rate value' do
      test_budget.base_rate = nil
      expect(test_budget).to_not be_valid
    end
    it 'is not valid without a fiscal year' do
      test_budget.fiscal_year = nil
      expect(test_budget).to_not be_valid
    end
  end

  context 'validating associations with other entities' do
    it 'is not valid without an associated member' do
      test_budget.member_id = nil
      expect(test_budget).to_not be_valid
    end
    it 'is not valid without an associated currency' do
      test_budget.currency_id = nil
      expect(test_budget).to_not be_valid
    end
  end

  context 'validating data types and value ranges' do
    it 'must have a base rate greater than zero' do
      test_budget.base_rate = -5
      expect(test_budget).to_not be_valid
    end
  end
end
