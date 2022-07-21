# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email                 {"test_admin@gmail.com"}
    password              {"111111"}
    password_confirmation {"111111"}
  end
end