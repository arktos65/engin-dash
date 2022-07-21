FactoryBot.define do
  factory :team do
    member { nil }
    project { nil }
    currency { nil }
    annual_rate { "9.99" }
    weekly_rate { "9.99" }
    start_date { "2022-07-21" }
    end_date { "2022-07-21" }
    allocation { 1 }
  end
end
