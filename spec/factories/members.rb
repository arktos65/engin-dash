FactoryBot.define do
  factory :member do
    first_name { "MyString" }
    last_name { "MyString" }
    start_date { "2022-07-21" }
    end_date { "2022-07-21" }
    is_active { false }
    role { nil }
    department { nil }
    source { nil }
  end
end
