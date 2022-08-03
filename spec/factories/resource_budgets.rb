FactoryBot.define do
  factory :resource_budget do
    member { nil }
    currency { nil }
    period_start { "2022-08-03" }
    period_end { "2022-08-03" }
    classification { 1 }
    base_rate { "9.99" }
    weekly_rate { "9.99" }
    monthly_rate { "9.99" }
    annual_rate { "9.99" }
    fiscal_year { 1 }
    comments { "MyText" }
  end
end
