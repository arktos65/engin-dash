FactoryBot.define do
  factory :resource_budget do
    member
    currency
    period_start { Faker::Date.backward(days: 180) }
    period_end { Faker::Date.forward(days: 180) }
    classification { 1 }
    base_rate { 0 }
    weekly_rate { 0 }
    monthly_rate { 0 }
    annual_rate { 100000 }
    fiscal_year { 2022 }
    comments { "MyText" }
  end
end
