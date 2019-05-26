FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    project
  end
end
