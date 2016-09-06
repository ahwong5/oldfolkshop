# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  User.create(email: "user#{i+1}@email.com", password: "password")
end


Category.find_or_create_by(name: "Medicines", description: "Daily vitamin supplies and supplements")
Category.find_or_create_by(name: "Adult Diapers", description: "Personal hygience and other wearables")
Category.find_or_create_by(name: "Hearing Aids", description: "Communication aids and assistance")
Category.find_or_create_by(name: "Elderly Phones", description: "Extra large number pad and other features")
Category.find_or_create_by(name: "Walkers", description: "A little help goes a long way")
Category.find_or_create_by(name: "Wheelchairs", description: "Mobility and freedom once again")
Category.find_or_create_by(name: "Bed Rails", description: "Going to bed and waking up are so easy")
Category.find_or_create_by(name: "Bathroom Equipments", description: "Safer and more convenient bathroom")

8.times do |i|
  8.times do |j|
  Item.create(name: "Item ##{j+1} Name", price: i+j+1, description: "This is an item description.", category_id: i+1)
  end
end
