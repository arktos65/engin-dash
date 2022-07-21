FactoryBot.define do
  factory :project do
    stream { nil }
    name { "MyString" }
    is_internal { false }
    is_trackable { false }
    start_date { "2022-07-21" }
    end_date { "2022-07-21" }
    is_active { false }
  end
end
