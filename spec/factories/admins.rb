# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email                 { "test_admin@gmail.com" }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    password              { "111111" }
    password_confirmation { "111111" }
  end
end