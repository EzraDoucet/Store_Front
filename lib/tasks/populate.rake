namespace :db do
 desc "Clear the DB and fill with excellent sample data."
 task populate: :environment do
  require 'faker'

  # clear DB
  [Product].each do |model|
   model.delete_all
  end

  5.times do
   product = Product.create(name: Faker::Ancient.god, price: rand(1.00..2000.00), quantity: rand(1..25), description: Faker::MostInterestingManInTheWorld.quote)
  end
  puts "Products made"
 end
end