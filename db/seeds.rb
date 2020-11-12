# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Ingredient.destroy_all
Cocktail.destroy_all

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_list = open(url).read
drinks = JSON.parse(drink_list)
drinks['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

Cocktail.create(name: "Gin Tonic")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Screwdriver")
Cocktail.create(name: "Tequila Sunrise")
Cocktail.create(name: "Long Island")
