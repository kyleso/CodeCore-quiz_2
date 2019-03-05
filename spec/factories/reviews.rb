FactoryBot.define do
  factory :review do
    body { Faker::GreekPhilosophers.quote }
    association(:user, factory: :user)
    association(:idea, factory: :idea)
  end
end
