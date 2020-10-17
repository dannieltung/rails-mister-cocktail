# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying all cocktails'
Cocktail.destroy_all

puts 'Destroying all doses'
Dose.destroy_all

puts 'Destroying all ingredients'
Ingredient.destroy_all

puts 'DROPPED db DROPPED'

puts 'Creating ingredient....'
5.times do
  ingredient = Ingredient.create(
    name: Faker::Food.ingredient
  )
  puts "Ingredient #{ingredient.id} created."
  puts 'Creating cocktail...'
  cocktail = Cocktail.create(
    name: Faker::Beer.name
  )
  puts "Cocktail #{cocktail.id} created."
  puts 'Creating dose...'
  dose = Dose.create(
    description: Faker::Food.measurement,
    ingredient: ingredient,
    cocktail: cocktail
  )
  puts "Dose #{dose.id} created"
end
puts 'Done!'
