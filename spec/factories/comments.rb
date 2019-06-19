FactoryBot.define do
  factory :comment do
    body { FFaker::Lorem.word }
    task
  end
end
