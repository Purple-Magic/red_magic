# frozen_string_literal: true

FactoryBot.define do
  factory :podcast do
    title { Faker::Lorem.sentence }
  end
end
