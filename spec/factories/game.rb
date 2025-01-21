FactoryBot.define do
  factory :game do
    title { Faker::Game.title }
    description { 'Lorem ipsum' }
  end
end
