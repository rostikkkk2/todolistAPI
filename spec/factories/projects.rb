FactoryBot.define do
  factory :project do
    name { Faker::Lorem.word }
    user
  end
end
