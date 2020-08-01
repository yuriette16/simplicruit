# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creat a new user...'
main_user = User.create(
  name: 'Farrah',
  email: 'farrah@simplicruit.com',
  password: '123456')
puts 'Finished'


puts 'Create a position...'
positions = Positions.create(
    title: 'Customer Service Representative',
    due_date: Faker::Date.in_date_period(year: 2020, month: 9),
)
puts 'Finished'
