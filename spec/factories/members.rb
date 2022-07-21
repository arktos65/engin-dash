# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    start_date { Faker::Date.between(from: '2020-09-01', to: '2022-06-29') }
    end_date { nil }
    is_active { true }
    role_id { nil }
    department_id { nil }
    source_id { nil }
  end
end
