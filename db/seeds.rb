# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


### Nettoyage de la BDD
User.destroy_all
Item.destroy_all
Cart.destroy_all
Order.destroy_all
JoinTableItemOrder.destroy_all
JoinTableItemCart.destroy_all
Category.destroy_all
JoinTableItemCategory.destroy_all

### Remplissage de la BDD

require 'faker'

Faker::Config.locale = 'fr'

# Création des users
User.create(
  email: "potichadmin@yopmail.com",
  password: "adminpwd",
  is_admin: true,
  first_name: 'Admin',
  last_name: 'istrateur'
)

user = User.create(email: "poticha-user@yopmail.com", password: "userpwd")

#Création de catégories
Category.create(name:"Chat")
Category.create(name:"Chien")
Category.create(name:"Poils courts")
Category.create(name:"Poils longs")

picturesArr = ["https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/0_thumbnail.png", 
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/5_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/4_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/8_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/11_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/18_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/22_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/28_thumbnail.png",
                "https://s3.amazonaws.com/api.coolcatsnft.com/thumbnails/31_thumbnail.png"
              ]

# Création des items
9.times do |i|
  Item.create(
    title: "Photo n°#{i}", 
    description: "Description n°#{i} : #{Faker::Lorem.words(number: 5).join(" ")}", 
    price: rand(10..500), 
    image_url: picturesArr[i]
  )
end

# Création panier / join table
# userCart = Cart.create(user: user)

# 1.times do |i|
#   JoinTableItemCart.create(cart: userCart, item: Item.all[i])
# end


# Création orders / join table
# userOrder1 = Order.create(user: user)

# 1.times do |i|
#   JoinTableItemOrder.create(order: userOrder1, item: Item.all[i])
#   JoinTableItemOrder.create(order: userOrder1, item: Item.all[i+4])
# end


# Création categories / join table
# 20.times do |i|
#   JoinTableItemCategory.create(item:Item.all.sample, category:Category.all.sample)
# end