# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

State.destroy_all
City.destroy_all
Address.destroy_all

10.times do
  state = State.new
  state.name = Faker::Address.state_abbr
  state.save!
end

puts "STATES!"

30.times do
  city = City.new
  city.name = Faker::Address.city
  city.state = State.order('RANDOM()').first
  city.save!
end


puts "CITIES!"

60.times do

  address = Address.new
  address.name = Faker::Address.street_address
  address.city = City.order('RANDOM()').first
  address.save!
end


puts "ADDRESSES!"

100.times do
  person = Person.new
  person.name = Faker::Name.first_name
  person.email = "#{Faker::Name.first_name}@gmail.com"
  person.address = Address.order('RANDOM()').first
  person.save!
end


puts "PERSONS!"


# Person.joins(:address).where(addresses: {name: "3811 Ethan Ranch"}) => retorna todas as pessoas que moram no 3811 Ethan Ranch
# Person.joins(address: :city).where(cities: {name: 'Lake Ranee'})=> retorna todas as pessoas que moram na cidade Lake Ranee
# Person.joins(address: {city: :state}).where(states: {name: 'AK'}) => retorna todas as pessoas que moram no estado AK
