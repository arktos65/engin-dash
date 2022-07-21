FactoryBot.define do
  factory :project do
    stream_id { nil }
    name { Faker::App.name }
    is_internal { false }
    is_trackable { true }
    start_date { Faker::Date.backward(days: 60) }
    end_date { nil }
    is_active { true }
  end
end
