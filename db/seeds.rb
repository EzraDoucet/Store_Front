# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brands = [
       'Nike',
       'Adidas',
       'Scarpa',
       'Taylor Stitch',
       'Darn Tough',
       'Yeti',
       'Topo Designs',
       'Schwinn',
       'La Sportiva',
]


brands.each do |brand_name|
 Brand.create(name: brand_name)
end
puts 'Your Brands have been created.'


categories = [
           'Biking',
           'Soccer',
           'Football',
           'Climbing',
           'Apparell',
           'Basball'
]

categories.each do |category_name|
  Category.create(name: category_name)
end
puts "Your Categories have been created."
