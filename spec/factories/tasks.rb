FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    complete { false }
  end
end
