# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake products...'
10.times do
  product = Product.new(
    name: Faker::Commerce.product_name,
    description: Faker::Commerce.material,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    price: Faker::Commerce.price
  )
  product.save!
end

puts 'Finished!'

# "#{Faker::Address.street_address}, #{Faker::Address.city}",
# rating: rand(0..5)
