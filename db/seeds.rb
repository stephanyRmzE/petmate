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

cat_photos = ['https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
              'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1743&q=80',
              'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=830&q=80',
              'https://images.unsplash.com/photo-1574158622682-e40e69881006?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
              'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=602&q=80',
              'https://images.unsplash.com/photo-1519052537078-e6302a4968d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80',
              'https://images.unsplash.com/photo-1618826411640-d6df44dd3f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1491485880348-85d48a9e5312?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1604675223954-b1aabd668078?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1543201245-c9031909fe6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1606011334315-025e4baab810?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80',
              'https://images.unsplash.com/photo-1602519362498-a57e90340bca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1599594584029-4b9f4bd06977?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1585699777545-355976789272?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1496284777878-ce2e3e4dd028?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1541781774459-bb2af2f05b55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1760&q=80']

dog_photos = ['https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',
              'https://images.unsplash.com/photo-1583512603805-3cc6b41f3edb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
              'https://images.unsplash.com/photo-1587300003388-59208cc962cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1477884213360-7e9d7dcc1e48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1537151625747-768eb6cf92b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80',
              'https://images.unsplash.com/photo-1596492784531-6e6eb5ea9993?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1575859431774-2e57ed632664?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1530126483408-aa533e55bdb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80',
              'https://images.unsplash.com/photo-1581888227599-779811939961?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',
              'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1600077106724-946750eeaf3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
              'https://images.unsplash.com/photo-1550953581-a75aa86fec20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80',
              'https://images.unsplash.com/photo-1588269845464-8993565cac3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1612536057832-2ff7ead58194?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
              'https://images.unsplash.com/photo-1604165094771-7af34f7fd4cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              'https://images.unsplash.com/photo-1611469023115-405af35a5f80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80']

bird_photos = ['https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1769&q=80',
               'https://images.unsplash.com/photo-1555169062-013468b47731?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
               'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
               'https://images.unsplash.com/photo-1480044965905-02098d419e96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
               'https://images.unsplash.com/photo-1548960095-770e3e6364de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80',
               'https://images.unsplash.com/photo-1552727451-6f5671e14d83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1688&q=80',
               'https://images.unsplash.com/photo-1550853024-fae8cd4be47f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1188&q=80',
               'https://images.unsplash.com/photo-1591198936750-16d8e15edb9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80',
               'https://images.unsplash.com/photo-1563278689-3519903a3e97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',
               'https://images.unsplash.com/photo-1553264701-d138db4fd5d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
               'https://images.unsplash.com/photo-1589258977674-a5ecbaf96ff2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
               'https://images.unsplash.com/photo-1619615383003-8ad8a96a3c9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
               'https://images.unsplash.com/photo-1596386447478-d71f5f8fea87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1712&q=80',
               'https://images.unsplash.com/photo-1533149335914-0a955b468338?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=742&q=80',
               'https://images.unsplash.com/photo-1517524501745-d45ba4383fa7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=970&q=80']

reptile_photos = ['https://images.unsplash.com/photo-1617540021016-72023b487e99?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80',
                  'https://images.unsplash.com/photo-1610629651605-0b181ad69aab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                  'https://images.unsplash.com/photo-1538439907460-1596cafd4eff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1756&q=80',
                  'https://images.unsplash.com/photo-1597776941486-054bf5529210?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1698&q=80',
                  'https://images.unsplash.com/photo-1617691763432-8b45e6748b71?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2231&q=80',
                  'https://images.unsplash.com/photo-1566599247237-d90417429f50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                  'https://images.unsplash.com/photo-1586981737052-a8e95549b821?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80',
                  'https://images.unsplash.com/flagged/photo-1571674369311-f7d0b6774c8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1659&q=80',
                  'https://images.unsplash.com/photo-1472645977521-95bbf4f0a748?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                  'https://images.unsplash.com/photo-1572650117973-7d78c3e9aedf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                  'https://images.unsplash.com/photo-1515632816436-da217f0aef30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=782&q=80',
                  'https://images.unsplash.com/photo-1568159737262-21c07f568066?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1775&q=80',
                  'https://images.unsplash.com/photo-1541077827726-91d90709efc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                  'https://images.unsplash.com/photo-1516488451233-4aaa157b87e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1773&q=80']

4.times do
  pet = Pet.create!(
    name: Faker::Creature::Cat.name,
    age: rand(1..10),
    species: 'Cat',
    breed: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user: owner_one
  )
  file1 = URI.open(cat_photos.sample)
  file2 = URI.open(cat_photos.sample)
  file3 = URI.open(cat_photos.sample)
  file4 = URI.open(cat_photos.sample)
  file5 = URI.open(cat_photos.sample)
  file6 = URI.open(cat_photos.sample)
  pet.photos.attach([{ io: file1, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file2, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file3, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file4, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file5, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file6, filename: pet.name, content_type: 'image/jpeg' }])
end

4.times do
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    age: rand(1..10),
    species: 'Dog',
    breed: Faker::Creature::Dog.breed,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user: owner_one
  )
  file1 = URI.open(dog_photos.sample)
  file2 = URI.open(dog_photos.sample)
  file3 = URI.open(dog_photos.sample)
  file4 = URI.open(dog_photos.sample)
  file5 = URI.open(dog_photos.sample)
  file6 = URI.open(dog_photos.sample)
  pet.photos.attach([{ io: file1, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file2, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file3, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file4, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file5, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file6, filename: pet.name, content_type: 'image/jpeg' }])
end

4.times do
  pet = Pet.create!(
    name: Faker::Dessert.variety,
    age: rand(1..10),
    species: 'Bird',
    breed: Faker::Creature::Bird.common_name,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user: owner_two
  )
  file1 = URI.open(bird_photos.sample)
  file2 = URI.open(bird_photos.sample)
  file3 = URI.open(bird_photos.sample)
  file4 = URI.open(bird_photos.sample)
  file5 = URI.open(bird_photos.sample)
  file6 = URI.open(bird_photos.sample)
  pet.photos.attach([{ io: file1, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file2, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file3, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file4, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file5, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file6, filename: pet.name, content_type: 'image/jpeg' }])
end

4.times do
  pet = Pet.create!(
    name: Faker::Games::Pokemon.name,
    age: rand(1..10),
    species: 'Reptile',
    breed: Faker::Games::ElderScrolls.dragon,
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    user: owner_two
  )
  file1 = URI.open(reptile_photos.sample)
  file2 = URI.open(reptile_photos.sample)
  file3 = URI.open(reptile_photos.sample)
  file4 = URI.open(reptile_photos.sample)
  file5 = URI.open(reptile_photos.sample)
  file6 = URI.open(reptile_photos.sample)
  pet.photos.attach([{ io: file1, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file2, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file3, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file4, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file5, filename: pet.name, content_type: 'image/jpeg' },
                     { io: file6, filename: pet.name, content_type: 'image/jpeg' }])
end

puts "seeding completed"
