# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Adnan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Olamilekan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(author: third_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
first_comment = Comment.create(author: first_user, post: first_post, text: 'This is my first comment')
second_comment = Comment.create(author: second_user, post: second_post, text: 'This is my second comment')
third_comment = Comment.create(author: third_user, post: third_post, text: 'This is my third comment')
fourth_comment = Comment.create(author: first_user, post: fourth_post, text: 'This is my fourth comment')
fifth_comment = Comment.create(author: second_user, post: first_post, text: 'This is my fifth comment')
sixth_comment = Comment.create(author: third_user, post: second_post, text: 'This is my sixth comment')
