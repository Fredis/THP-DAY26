# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do |element|
	users = User.create!(prenom: Faker::Artist.name, nom: Faker::Ancient.god, email: Faker::Internet.email, password: Faker::Internet.password(10, 20))
end