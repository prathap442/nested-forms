# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 100.times do 
#   Article.create(title: Faker::Bitcoin.address,body: Faker::Lorem.sentence(1),category_id:1,published_date: Faker::Date.between(1.year.ago, Date.today),is_published: [true,false].sample(1),cover: "fjdskjfjsdadkj",user_id: 1)
# end
100.times do 
  Product.create(name: Faker::Name.first_name)
end