require 'faker'
require 'net/http'
require 'json'
require 'pry'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#API INFORMATION
keys = ['yc3qwjt2jcam6kzh43euey6n', 'ecsry33dby9axu6b74zk2p2u']
key = keys.sample
url = "http://api.jambase.com/events?zipCode=11238&radius=10&startDate=2018-05-08T00%3A00%3A00&endDate=2018-05-10T00%3A00%3A00&page=0&api_key=#{key}&o=json"
uri = URI(url)
response = Net::HTTP.get(uri)
r = JSON.parse(response)


# sample_response = {
#     "Info": {
#         "TotalResults": 12,
#         "PageNumber": 0
#     },
#     "Events": [{
#         "Id": 3104089,
#         "Date": "2018-05-08T19:00:00",
#         "Venue": {
#             "Id": 141441,
#             "Name": "Rockwood Music Hall Stage 3 ",
#             "Address": "185 Orchard St",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10002",
#             "Url": "",
#             "Latitude": 0.0,
#             "Longitude": 0.0
#         },
#         "Artists": [{
#             "Id": 113391,
#             "Name": "Jeremy Aaron"
#         }],
#         "TicketUrl": "http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/1630420/tfly?utm_medium=api"
#     }, {
#         "Id": 3078145,
#         "Date": "2018-05-08T23:00:00",
#         "Venue": {
#             "Id": 144506,
#             "Name": "Blackthorn 51 ",
#             "Address": "80-12 51 Ave",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "11373",
#             "Url": "",
#             "Latitude": 0.0,
#             "Longitude": 0.0
#         },
#         "Artists": [{
#             "Id": 36216,
#             "Name": "The Iron Maidens"
#         }],
#         "TicketUrl": "http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/1593773/tfly?utm_medium=api"
#     }, {
#         "Id": 3092933,
#         "Date": "2018-05-09T00:00:00",
#         "Venue": {
#             "Id": 162526,
#             "Name": "Walter Kerr Theatre",
#             "Address": "219 W 48th St",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10036",
#             "Url": "",
#             "Latitude": 0.0,
#             "Longitude": 0.0
#         },
#         "Artists": [{
#             "Id": 12385,
#             "Name": "Bruce Springsteen"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fspringsteen-on-broadway-ny-new-york-new-york-05-09-2018%2Fevent%2F3000538DD15E3D2A"
#     }, {
#         "Id": 3101049,
#         "Date": "2018-05-09T00:00:00",
#         "Venue": {
#             "Id": 3,
#             "Name": "Madison Square Garden",
#             "Address": "7th Avenue & 32nd Street",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10010",
#             "Url": "http://www.thegarden.com",
#             "Latitude": 40.749344,
#             "Longitude": -73.992129
#         },
#         "Artists": [{
#             "Id": 44413,
#             "Name": "Bon Jovi"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fbon-jovi-this-house-is-not-new-york-new-york-05-09-2018%2Fevent%2F3B00537CE6EB2205"
#     }, {
#         "Id": 3079699,
#         "Date": "2018-05-09T18:30:00",
#         "Venue": {
#             "Id": 2770,
#             "Name": "Mercury Lounge",
#             "Address": "217 East Houston Street ",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10012",
#             "Url": "http://www.mercuryloungenyc.com/",
#             "Latitude": 40.724859,
#             "Longitude": -73.993401
#         },
#         "Artists": [{
#             "Id": 105123,
#             "Name": "Liza Anne"
#         }],
#         "TicketUrl": "http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/1595194/tfly?utm_medium=api"
#     }, {
#         "Id": 3109047,
#         "Date": "2018-05-09T19:00:00",
#         "Venue": {
#             "Id": 164153,
#             "Name": "Elsewhere (Hall)",
#             "Address": "599 Johnson Avenue",
#             "City": "Brooklyn",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "11237",
#             "Url": "",
#             "Latitude": 0.0,
#             "Longitude": 0.0
#         },
#         "Artists": [{
#             "Id": 102540,
#             "Name": "Power Trip"
#         }, {
#             "Id": 111271,
#             "Name": "Sheer Mag"
#         }],
#         "TicketUrl": "http://eventbrite.com/e/power-trip-sheer-mag-elsewhere-hall-tickets-42276123022"
#     }, {
#         "Id": 3102288,
#         "Date": "2018-05-09T20:30:00",
#         "Venue": {
#             "Id": 114485,
#             "Name": "Rockwood Music Hall Stage 2",
#             "Address": "196 Allen St",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10002",
#             "Url": "http://www.rockwoodmusichall.com",
#             "Latitude": 40.7224788,
#             "Longitude": -73.9886667
#         },
#         "Artists": [{
#             "Id": 36232,
#             "Name": "David Ford"
#         }],
#         "TicketUrl": "http://www.shareasale.com/r.cfm?u=460319&b=234786&m=27601&afftrack=&urllink=https://www.ticketfly.com/purchase/event/1628203/tfly?utm_medium=api"
#     }, {
#         "Id": 2964693,
#         "Date": "2018-05-10T00:00:00",
#         "Venue": {
#             "Id": 114570,
#             "Name": "Isaac Stern Auditorium @ Carnegie Hall",
#             "Address": "881 7th Ave",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10019",
#             "Url": "http://www.carnegiehall.org",
#             "Latitude": 40.7650146484375,
#             "Longitude": -73.9798965454102
#         },
#         "Artists": [{
#             "Id": 81574,
#             "Name": "Emanuel Ax"
#         }],
#         "TicketUrl": ""
#     }, {
#         "Id": 3105955,
#         "Date": "2018-05-10T00:00:00",
#         "Venue": {
#             "Id": 5554,
#             "Name": "B.B. King Blues Club & Grill",
#             "Address": "237 West 42nd Street",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10036",
#             "Url": "http://bbkingblues.com",
#             "Latitude": 40.75659,
#             "Longitude": -73.988102
#         },
#         "Artists": [{
#             "Id": 31998,
#             "Name": "Brian McKnight"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fthe-brian-mcknight-4-new-york-new-york-05-10-2018%2Fevent%2F000054339B80372A"
#     }, {
#         "Id": 3064847,
#         "Date": "2018-05-10T00:00:00",
#         "Venue": {
#             "Id": 61749,
#             "Name": "St. George Theater",
#             "Address": "35 Hyatt Street",
#             "City": "Staten Island",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10301",
#             "Url": "http://www.stgeorgetheater.com",
#             "Latitude": 40.641893,
#             "Longitude": -74.076965
#         },
#         "Artists": [{
#             "Id": 46379,
#             "Name": "The Temptations"
#         }, {
#             "Id": 47010,
#             "Name": "The Four Tops"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fevent%2F0000534AA0FD22C5"
#     }, {
#         "Id": 3101050,
#         "Date": "2018-05-10T00:00:00",
#         "Venue": {
#             "Id": 3,
#             "Name": "Madison Square Garden",
#             "Address": "7th Avenue & 32nd Street",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10010",
#             "Url": "http://www.thegarden.com",
#             "Latitude": 40.749344,
#             "Longitude": -73.992129
#         },
#         "Artists": [{
#             "Id": 44413,
#             "Name": "Bon Jovi"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fbon-jovi-this-house-is-not-new-york-new-york-05-10-2018%2Fevent%2F3B00537CE6F32207"
#     }, {
#         "Id": 3092934,
#         "Date": "2018-05-10T00:00:00",
#         "Venue": {
#             "Id": 162526,
#             "Name": "Walter Kerr Theatre",
#             "Address": "219 W 48th St",
#             "City": "New York",
#             "State": "New York",
#             "StateCode": "NY",
#             "Country": "US",
#             "CountryCode": "US",
#             "ZipCode": "10036",
#             "Url": "",
#             "Latitude": 0.0,
#             "Longitude": 0.0
#         },
#         "Artists": [{
#             "Id": 12385,
#             "Name": "Bruce Springsteen"
#         }],
#         "TicketUrl": "http://ticketmaster.evyy.net/c/252938/264167/4272?u=http%3A%2F%2Fwww.ticketmaster.com%2Fspringsteen-on-broadway-ny-new-york-new-york-05-10-2018%2Fevent%2F3000538DD15F3D2C"
#     }]
# }

r['Events'].each do |event|
  if event['Artists'].length > 1
    event['Artists'].each do |artist|
      a = Artist.find_or_create_by(name: artist['Name'], api_artist_id: artist['Id'])
    end
  else
    a = Artist.find_or_create_by(name: event['Artists'][0]['Name'], api_artist_id: event['Artists'][0]['Id'])
  end
    v = Venue.find_or_create_by(
      api_venue_id: event['Venue']['Id'],
      name: event['Venue']['Name'],
      address: event['Venue']['Address'],
      city: event['Venue']['City'],
      state: event['Venue']['State'],
      state_code: event['Venue']['StateCode'],
      zip: event['Venue']['ZipCode'],
      url: event['Venue']['Url'],
      lat: event['Venue']['Latitude'],
      long: event['Venue']['Longitude']
    )
    s = Show.find_or_create_by(
      api_show_id: event['Id'],
      showtime: event['Date'],
      venue: v,
      artist: a
    )

end


# # USERS
# 50.times do
#   user = User.create(name: Faker::Name.unique.name, phone: 10.times.map{rand(10)}.join, email: Faker::Internet.unique.email)
# end
#
# # ARTISTS
# 50.times do
#   artist = Artist.create(name: Faker::RockBand.name)
# end
#
# # VENUE
# 50.times do
#   venue = Venue.create(name: Faker::Company.name)
# end
#
# # SHOW
# 50.times do
#   show = Show.create(artist: Artist.all.sample, venue: Venue.all.sample, showtime: Faker::Date.forward(90))
# end
#
# # FAN
# 50.times do
#   fan = Fan.create(user: User.all.sample, artist: Artist.all.sample)
# end
#
# # Attends
# 50.times do
#   attends = Attend.create(user: User.all.sample, show: Show.all.sample, rating: Random.rand(1..10), checkin: Faker::Boolean.boolean)
# end
#
# # setlists
# 50.times do
#   setlist = Setlist.create(artist: Artist.all.sample, content: Faker::Lorem.paragraph(2))
# end
