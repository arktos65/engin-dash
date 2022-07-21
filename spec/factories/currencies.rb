# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    name { Faker::Currency.name }
    code { Faker::Currency.code }
    exchange_rate { Faker::Number.between(from: 1, to: 3) }
  end
end
