class CreateResourceBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_budgets do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :currency, null: false, foreign_key: true
      t.date :period_start
      t.date :period_end
      t.integer :classification, default: 0
      t.decimal :base_rate
      t.decimal :weekly_rate
      t.decimal :monthly_rate
      t.decimal :annual_rate
      t.integer :fiscal_year
      t.text :comments

      t.timestamps
    end
  end
end
