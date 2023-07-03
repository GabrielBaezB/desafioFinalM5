50.times do |i|
  Tweet.create(
    userAvatar: Faker::Avatar.image,
    description: Faker::Lorem.sentence,
    UserName: Faker::Internet.username
  )
end