FactoryBot.define do
  factory :motorcycle do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    year { Faker::Vehicle.year }
    user
  end
end
