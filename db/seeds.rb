require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all
50.times do |i|
  Product.create!({name: Faker::Appliance.equipment, company: Faker::Appliance.brand, country_of_origin: Faker::Address.country, cost: Faker::Commerce.price })
end
i = 1
n = 1
x = 0
249.times do |index|

  if i == x + 5
    x += 5
    n += 1
  end
  product = Product.find(n)
  review = product.reviews.create!({user_name: Faker::Name.name, text: Faker::Lorem.paragraph(sentence_count: 4), rubies: Faker::Number.between(from: 1, to: 5)})
  i += 1
end

truck = Product.new({name: "Ford Truck", company: "Ford", country_of_origin: "usa", cost: "40,000" })

truck.save
