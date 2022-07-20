FactoryBot.define do
  factory :department do
    name { Faker::Name.name }
    division { Faker::Business.name }
    user { nil }
  end
end
