json.extract! resource_budget, :id, :member_id, :currency_id, :period_start, :period_end, :classification, :base_rate, :weekly_rate, :monthly_rate, :annual_rate, :fiscal_year, :comments, :created_at, :updated_at
json.url resource_budget_url(resource_budget, format: :json)
