# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    member_id { nil }
    project_id { nil }
    currency_id { nil }
    annual_rate { Faker::Number.between(from: 80_000, to: 130_000) }
    weekly_rate { nil }
    start_date { Faker::Date.backward(days: 45) }
    end_date { nil }
    allocation { 100 }
  end
end
