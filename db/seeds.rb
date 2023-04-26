# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             confirmation_sent_at: Time.zone.now,
             confirmed_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               confirmation_sent_at: Time.zone.now,
               confirmed_at: Time.zone.now)
end

 users = User.all
 user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user&.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.order(:created_at).take(6)

50.times do
  content = Faker::Lorem.sentence(word_count: 10)
  users.each { |_user| _user.microposts.create!(content: content)}
end

users.each do |_user|
  number_of_users = rand(2..15)
  other_users = users.reject { |u| u == _user}.sample(number_of_users)
  other_users.each{ |other_user| _user.microposts.each { |micropost| micropost.likes.create!(user_id: other_user.id)}}
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?