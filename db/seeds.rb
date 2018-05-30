require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Desk.destroy_all

# User.destroy_all
# Rate.destroy_all


Rate.create(pricing: 'per hour')
Rate.create(pricing: 'per day')
Rate.create(pricing: 'per week')
Rate.create(pricing: 'per month')

# 10.times do
#   desk = Desk.new (
#     name)


  # Faker::FunnyName.two_word_name #=> "Shirley Knot"
  # Faker::Address.full_address #=> "282 Kevin Brook, Imogeneborough, CA 58517"

10.times do
  User.create(name: Faker::FunnyName.two_word_name , email: Faker::Internet.email, password:"123456")
  puts "user created"
end

User.all.each do |user|
  4.times do
    desk = Desk.new(name: "Desk in Bairro Alto", user_id: user.id, price: 5, description: "Very quiet neighborhood, exceptionally professional with amazing connections to make. The desks are located in an old nightclub",
      address: "261, rua da Rosa", remote_photo_url: "https://picsum.photos/200/300/?random")
    if desk.save
      puts "Success creating this desk #{desk.name}"
    end
  end
end


