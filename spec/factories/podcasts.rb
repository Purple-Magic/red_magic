FactoryBot.define do
  factory :podcast do
    title { Faker::Lorem.sentence }
  end
end
