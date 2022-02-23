# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "faker"

puts 'Cleaning database'
Reservation.destroy_all
Pet.destroy_all
User.destroy_all

puts 'Adding database items'

renter_one = User.create!(first_name: 'James', last_name: 'Smith', email: "renter_one@gmail.com", password: "password")
renter_two = User.create!(first_name: 'Jane', last_name: 'Doe', email: "renter_two@gmail.com", password: "password")
owner_one = User.create!(first_name: 'John', last_name: 'Doe', email: "owner_one@gmail.com", password: "password")
owner_two = User.create!(first_name: 'Alice', last_name: 'Smith', email: "owner_two@gmail.com", password: "password")

cat_photos = ['https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80', 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1743&q=80', 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=830&q=80', 'https://images.unsplash.com/photo-1574158622682-e40e69881006?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80']
dog_photos = ['https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80', 'https://images.unsplash.com/photo-1583512603805-3cc6b41f3edb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80', 'https://images.unsplash.com/photo-1587300003388-59208cc962cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80', 'https://images.unsplash.com/photo-1477884213360-7e9d7dcc1e48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80']
bird_photos = ['https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80', 'https://images.unsplash.com/photo-1555169062-013468b47731?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80', 'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80', 'https://images.unsplash.com/photo-1480044965905-02098d419e96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80']

4.times do
  pet = Pet.create!(
    name: Faker::Creature::Cat.name,
    age: rand(1..10),
    species: 'Cat',
    breed: Faker::Creature::Cat.breed,
    user: owner_one
  )
  file = URI.open(cat_photos.sample)
  pet.photo.attach(io: file, filename: pet.name, content_type: 'image/jpeg')
end

4.times do
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    age: rand(1..10),
    species: 'Dog',
    breed: Faker::Creature::Dog.breed,
    user: owner_one
  )
  file = URI.open(dog_photos.sample)
  pet.photo.attach(io: file, filename: pet.name, content_type: 'image/jpeg')
end

4.times do
  pet = Pet.create!(
    name: Faker::Dessert.variety,
    age: rand(1..10),
    species: 'Bird',
    breed: Faker::Creature::Bird.common_name,
    user: owner_two
  )
  file = URI.open(bird_photos.sample)
  pet.photo.attach(io: file, filename: pet.name, content_type: 'image/jpeg')
end

puts "seeding completed"
