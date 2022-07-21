# frozen_string_literal: true

FactoryBot.define do
  factory :stream do
    name { Faker::Business.name }
    business_unit { 'Product' }
    stakeholder_name {  Faker::Name.name }
    stakeholder_email { Faker::Internet.safe_email }
  end
end
