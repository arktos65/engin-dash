FactoryBot.define do
  factory :resource_budget do
    member
    currency
    period_start { Faker::Date.backward(days: 180) }
    period_end { Faker::Date.forward(days: 180) }
    classification { 1 }
    base_rate { 45 }
    weekly_rate { nil }
    monthly_rate { nil }
    annual_rate { nil }
    fiscal_year { 2022 }
    comments { "MyText" }
  end
end
