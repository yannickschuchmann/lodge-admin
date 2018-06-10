# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_or_create_by!(email: "yannick.schuchmann@googlemail.com") do |user|
  user.address = Address.new
  user.first_name = "Yannick"
  user.last_name = "Schuchmann"
  user.password = "changethis"
  user.password_confirmation = "changethis"
end

user = User.find_or_create_by!(email: "demskilena@gmail.com") do |user|
  user.address = Address.new
  user.first_name = "Lena"
  user.last_name = "Demski"
  user.password = "changethis"
  user.password_confirmation = "changethis"
end