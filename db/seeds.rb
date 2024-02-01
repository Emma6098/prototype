# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating users"
users = User.create([
{first_name: "Emma", last_name: "Creteur", nick_name: "Emma6", email: "emma@toto.com", password: 123456},
{first_name: "Clara", last_name: "Herkert", nick_name: "Clara9", email: "clara@toto.com", password: 123456},
{first_name: "Thomas", last_name: "Cambriels",nick_name: "Thomas8", email: "thomas@toto.com", password: 123456}
])
puts "finished users"
puts "creating articles"
articles = Article.create!([
  {user_id: User.first.id, name: "Teeshirt Nike", description: "Très bon état", price: 5, size: "S", brand: "Nike", state: "Neuf", color: "Blanc", categorie: "Teeshirt"},
  {user_id: User.second.id, name: "Pantalon Adidas", description: "Super", price: 10, size: "36", brand: "Adidas", state: "Neuf", color: "Noir", categorie: "Jogging"},
  {user_id: User.third.id, name: "Chemise Lacoste", description: "Trou sous la manche", price: 8, size: "L", brand: "Lacoste", state: "Mauvais état", color: "Bleu", categorie: "Chemise"},
])
puts "finished articles"
