User.create!(name: "Example User",
             email:"welcome@railstutorial.org",
             password: "111111",
             password_confirmation: "111111",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  name = "Example #{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end


# Following relationships
users = User.all
user = users.first
following = users[2..20]
followers = users[3..15]
following.each{|followed| user.follow(followed)}
followers.each{|follower| follower.follow(user)}
