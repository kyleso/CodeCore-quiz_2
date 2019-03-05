FactoryBot.define do
  factory :idea do
    title { Faker::TvShows::BojackHorseman.quote }
    description { Faker::Lorem.paragraph }
    association(:user, factory: :user)
  end
end
