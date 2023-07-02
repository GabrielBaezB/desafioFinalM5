50.times do |i|
  Tweet.create(
    description: Faker::Lorem.sentence,
    UserName: Faker::Internet.username
  )
end