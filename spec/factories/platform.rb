FactoryBot.define do
  factory :platform do
    name { Faker::Game.platform }
  end
end
