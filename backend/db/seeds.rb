require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
50.times do
  user = User.create(name: Faker::Name.unique.name, phone: 10.times.map{rand(10)}.join, email: Faker::Internet.unique.email)
end

# ARTISTS
50.times do
  artist = Artist.create(name: Faker::RockBand.name)
end

# VENUE
50.times do
  venue = Venue.create(name: Faker::Company.name)
end

# SHOW
50.times do
  show = Show.create(artist: Artist.all.sample, venue: Venue.all.sample, showtime: Faker::Date.forward(90))
end

# FAN
50.times do
  fan = Fan.create(user: User.all.sample, artist: Artist.all.sample)
end

# Attends
50.times do
  attends = Attend.create(user: User.all.sample, show: Show.all.sample, rating: Random.rand(1..10), checkin: Faker::Boolean.boolean)
end

# setlists
50.times do
  setlist = Setlist.create(artist: Artist.all.sample, content: Faker::Lorem.paragraph(2))
end
