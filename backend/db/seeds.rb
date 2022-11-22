# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
for a in 1..5 do
    User.find_or_create_by(id: a) do |user|
        user.username = Faker::Name.unique.name
        user.firstname = Faker::Name.name
        user.lastname = Faker::Name.name
        user.email = Faker::Internet.email
        user.password = 'Pasdword1234'
    end
    for b in 1..5 do
        Post.create do |post|
            post.user_id = a
            post.post_title = Faker::Lorem.sentence
            post.post_body = Faker::Lorem.paragraph
        end    
    end    
end

for c in 1..5 do
    for d in 1..5 do
        Comment.create do |comment|
            comment.user_id = c
            comment.post_id = d
            comment.comment_body = Faker::Lorem.paragraph
        end
    end
end
