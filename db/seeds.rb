# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |loop|
	# user_id | user_handle | message | sentiment | followers 
	Tweet.create({ user_id: loop, user_handle: "user_#{loop}", message: "Hi there, coke #{loop}", sentiment: rand(-1..1), followers: rand(20..300)})
end

(1..5).each do |loop|
	# user_id | user_handle | message | sentiment | followers 
	Tweet.create({ user_id: loop * 6, user_handle: "user_#{loop}", message: "Hi there, coca-cola #{loop * 6}", sentiment: rand(-1..1), followers: rand(20..300)})
end

(1..5).each do |loop|
	# user_id | user_handle | message | sentiment | followers 
	Tweet.create({ user_id: loop * 10, user_handle: "user_#{loop}", message: "Hi there, diet-cola #{loop * 10}", sentiment: rand(-1..1), followers: rand(20..300)})
end