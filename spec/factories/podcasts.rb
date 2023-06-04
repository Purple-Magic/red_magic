FactoryBot.define do
  factory :podcast do
    title { Faker::Lorem.sentence }
    logo { 'public/apple-touch-icon.png' }
  end
end
