# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email                 { "test_admin@gmail.com" }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    password              { "password123" }
    password_confirmation { "password123" }
  end
end