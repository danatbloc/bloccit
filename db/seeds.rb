# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'random_data'

 5.times do
   User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
   )
 end
 users = User.all

 15.times do
   Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
   )
 end
 topics = Topic.all

 50.times do
   post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
   )
   post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

   rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
 end


 20.times do

   SponsoredPost.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price: rand(50..100)
   )
 end

 posts = Post.all

 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 10.times do
   Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: rand(10..50)
   )
 end

 10.times do
   Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: [true, false].sample
   )
 end

 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

 moderator = User.create!(
   name:     'Moderator User',
   email:    'moderator@example.com',
   password: 'helloworld'
 )


 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
 puts "#{Vote.count} votes created"
 puts "#{Advertisement.count} ads created"
 puts "#{Question.count} questions created"
