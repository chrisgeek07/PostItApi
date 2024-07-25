# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   
#
#
puts "Deleting all users"
User.destroy_all
puts "All users have been deleted"

puts "Creating a new user and a post..."

 chris = User.create( username: 'Chris', password: 'password')

 post1 = Post.create( post: 'Hey, this is my new post! Much more to come', user_id: 1)

 puts "New user and post have been created successfully."
