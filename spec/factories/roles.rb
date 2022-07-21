# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Job.title }
    is_shared { false }
    is_administration { false }
    department_id { nil }
  end
end
