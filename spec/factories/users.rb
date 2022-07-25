FactoryBot.define do
  factory :user do
    email                 { "test@gmail.com" }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    password              { "111111" }
    password_confirmation { "111111" }
  end
end