require 'rails_helper'

RSpec.describe ResourceBudget, type: :model do
  # Create data objects to be tested
  test_budget = FactoryBot.create(:resource_budget)

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
    it 'must have a weekly rate greater than zero' do
      test_budget.weekly_rate = -5
      expect(test_budget).to_not be_valid
    end
    it 'must have a monthly rate greater than zero' do
      test_budget.monthly_rate = -5
      expect(test_budget).to_not be_valid
    end
    it 'must have a annual rate greater than zero' do
      test_budget.annual_rate = -5
      expect(test_budget).to_not be_valid
    end
  end
end
