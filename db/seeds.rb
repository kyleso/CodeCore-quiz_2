User.destroy_all
Idea.destroy_all

PASSWORD = "123"

50.times do
  name = Faker::Name.unique.name
  email = Faker::Internet.unique.email
  User.create(
    name: name,
    email: email,
    password: PASSWORD,
  )
end

users = User.all

100.times do
  created_at = Faker::Date.backward(365 * 2)

  idea = Idea.create(
    title: Faker::TvShows::BojackHorseman.quote,
    description: Faker::Lorem.paragraph,
    created_at: created_at,
    updated_at: created_at,
    user: users.sample,
  )
end
