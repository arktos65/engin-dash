FactoryBot.define do
  factory :role do
    name { "MyString" }
    is_shared { false }
    is_administration { false }
    department { nil }
  end
end
