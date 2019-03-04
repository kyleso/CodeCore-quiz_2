Idea.destroy_all

50.times do
  created_at = Faker::Date.backward(365 * 2)

  idea = Idea.create(
    title: Faker::TvShows::BojackHorseman.quote,
    description: Faker::Lorem.paragraph,
    created_at: created_at,
    updated_at: created_at,
  )
end
