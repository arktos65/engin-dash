class AddRateTypeToResourceBudget < ActiveRecord::Migration[6.1]
  def change
    add_column :resource_budgets, :rate_type, :integer
  end
end
