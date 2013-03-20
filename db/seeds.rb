# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

john = User.create(name: 'John', email: 'lennon@beatles.com', password: 'test')

george = User.create(name: 'George', email: 'harrison@beatles.com', password: 'test')

ringo = User.create(name: 'Ringo', email: 'starr@beatles.com', password: 'test')

paul = User.create(name: 'Paul', email: 'mccartney@beatles.com', password: 'test')

Relationship.delete_all
john.relationships.build(followed_id: george.id)
john.relationships.build(followed_id: ringo.id)
george.relationships.build(followed_id: john.id)
paul.relationships.build(followed_id: george.id)
paul.relationships.build(followed_id: john.id)
paul.relationships.build(followed_id: ringo.id)

Post.delete_all
post1 = Post.create(content: 'This is a cool cat', user_id:john.id, url:"http://farm9.staticflickr.com/8237/8573722646_befeb68bb8_m.jpg")
post2 = Post.create(content: 'Wow, a cat!', user_id:paul.id, url:"http://farm9.staticflickr.com/8233/8572620513_19719557c3_m.jpg")
post3 = Post.create(content: 'Hey, another cat!', user_id:paul.id, url:"http://farm9.staticflickr.com/8522/8573706644_2552c03bab_m.jpg")
post4 = Post.create(content: 'These are kinda scary...', user_id:george.id, url:"http://farm9.staticflickr.com/8089/8572608241_74998d264f_m.jpg")
post5 = Post.create(content: 'Beautiful photo', user_id:ringo.id, url:"http://farm9.staticflickr.com/8520/8572624063_2a82b7cfbf_m.jpg")
post6 = Post.create(content: 'Check out my drawing', user_id:ringo.id, url:"http://farm9.staticflickr.com/8107/8573694394_0f47c4e7d9_m.jpg")
post7 = Post.create(content: 'What are you looking at?', user_id:paul.id, url:"http://farm9.staticflickr.com/8388/8573713994_ffb58d1ebf_m.jpg")
post8 = Post.create(content: 'Sad :(', user_id:paul.id, url:"http://farm9.staticflickr.com/8524/8573678300_e2ba48d241_m.jpg")
post9 = Post.create(content: 'Friends :)', user_id:paul.id, url:"http://farm9.staticflickr.com/8244/8573677302_7bac2435d8_m.jpg")
post10 = Post.create(content: 'Purrrrrfect', user_id:john.id, url:"http://farm9.staticflickr.com/8368/8572581841_10b6672f01_m.jpg")

post1.upvotes = 2
post2.upvotes = 5
post3.upvotes = 10
post4.upvotes = 22
post5.upvotes = 6
post6.upvotes = 55
post7.upvotes = 2
post8.upvotes = 22
post9.upvotes = 18
post10.upvotes = 0

post1.save
post2.save
post3.save
post4.save
post5.save
post6.save
post7.save
post8.save
post9.save
post10.save
