# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create! id: 1, name: "image1", resolution:"SD", image_link:"a", price: 100.0, active: true
Product.create! id: 2, name: "image2", resolution:"HD", image_link:"b", price: 150.0, active: true
Product.create! id: 3, name: "image3", resolution:"UHD", image_link:"c", price: 200.0, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
