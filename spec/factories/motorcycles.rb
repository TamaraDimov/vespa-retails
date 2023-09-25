FactoryBot.define do
  factory :motorcycle do
    make { "Honda" }
    name { "CBR600" }
    model { "2023" }
    description { "A motorcycle" }
    association :user
  end
end
