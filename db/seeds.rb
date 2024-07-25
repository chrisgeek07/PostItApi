# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   
 chris = User.create( username: 'Chris', password: 'password')

 post1 = Post.create( post: 'Hey, this is my new post! Much more to come', user_id: 1)
