# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    podcast
    title { Faker::Lorem.sentence }
  end
end
