require 'faker'
require 'net/http'
require 'json'
require 'pry'
require 'yaml'

# connect to the API
key = YAML.load_file('keys2.yml')
d = Date.today
dplus7 = (d+7).to_s
d = d.to_s
url = "http://api.songkick.com/api/3.0/metro_areas/7644/calendar.json?apikey=#{key}&min_date=#{d}&max_date=#{dplus7}"

# method for getting new data
def getData (url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
end

r = getData(url) #should return r json

# get the basics
perPage = r["resultsPage"]["perPage"]
totalEntries = r["resultsPage"]["totalEntries"].to_f
pages = (totalEntries / perPage).ceil
page = r["resultsPage"]["page"]

# store my venues to fill in
all_venues = []

while page <= pages
  # go through each even object
  r["resultsPage"]["results"]["event"].each do |event|
    if event["venue"]["id"] && event["performance"][0]["artist"]["id"]
      #create the artist
      event_artists = []
      event["performance"].each do |set|
        artist = Artist.find_or_create_by(
          name: set["displayName"],
          songkick_url: set["artist"]["uri"],
          songkick_id: set["artist"]["id"]
        )
        puts "Created an artist for #{artist.name} (#{artist.id})"
        event_artists << artist
      end

      #create the venue
      venue = Venue.find_or_create_by(
        songkick_id: event["venue"]["id"],
        name: event["venue"]["displayName"],
        lat: event["venue"]["lat"],
        long: event["venue"]["lng"],
        songkick_metro: event["venue"]["metroArea"]["id"],
        songkick_url: event["venue"]["uri"]
      )
      all_venues << venue
      puts "Created an venue for #{venue.name} (#{venue.id})"

      #create the show
      event_artists.each do |artist|
        show = Show.find_or_create_by(
          artist: artist,
          venue: venue,
          date: event["start"]["date"],
          time: event["start"]["time"].to_s,
          #showtime: DateTime.parse(event["start"]["datetime"]),
          songkick_popularity: event["popularity"],
          songkick_id: event["id"],
          songkick_url: event["uri"]
        )
        puts "Created a Show ID: #{show.id} with Artist Name: #{show.artist.name}, Venue Name: #{show.venue.name}"
      end
      puts ""
    else
      puts "SKIPPING AN EVENT"
      puts ""
    end #out check if the artist and venue id exist
  end #stop going through the events

  #logging
  puts "Finished page #{page} of #{pages}."
  puts Artist.all.count
  puts Venue.all.count
  puts Show.all.count
  puts "Calling new page in 3 seconds"
  sleep 3

  #go into the next page
  page += 1
  if page <= pages
    url = "http://api.songkick.com/api/3.0/metro_areas/7644/calendar.json?apikey=#{key}&min_date=#{d}&max_date=#{dplus7}&page=#{page}"
    r = getData(url)
  end

end #end the looping

# CALL THE VENUE API
venues_count = Venue.all.count
Venue.all.each do |venue|
  puts "Starting venue #{venue.id} of #{venues_count}"
    url = "http://api.songkick.com/api/3.0/venues/#{venue.songkick_id}.json?apikey=#{key}"
    r = getData(url)
    data = r["resultsPage"]["results"]["venue"]
    # venue = Venue.find(VenueObj.id)
    venue.phone = data["phone"]
    venue.street = data["street"]
    venue.city = data["city"]["displayName"]
    venue.city_id = data["city"]["id"]
    venue.state_code = data["city"]["state"]["displayName"]
    venue.zip = data["zip"]
    venue.website = data["website"]
    venue.description = data["description"]
    venue.capacity = data["capacity"]
    venue.save
    puts "Updated the venue #{venue.name}, known for #{venue.description} and available at #{venue.website}."
end

# #USERS
# 50.times do
#   user = User.create(name: Faker::Name.unique.name, phone: 10.times.map{rand(10)}.join, email: Faker::Internet.unique.email)
# end

# #ARTISTS
# 50.times do
#   artist = Artist.create(name: Faker::RockBand.name)
# end

# #VENUE
# 50.times do
#   venue = Venue.create(name: Faker::Company.name)
# end

# #SHOW
# 50.times do
#   show = Show.create(artist: Artist.all.sample, venue: Venue.all.sample, showtime: Faker::Date.forward(90))
# end

# #FAN
# 50.times do
#   fan = Fan.create(user: User.all.sample, artist: Artist.all.sample)
# end
#
# #Attends
# 50.times do
#   attends = Attend.create(user: User.all.sample, show: Show.all.sample, rating: Random.rand(1..10), checkin: Faker::Boolean.boolean)
# end

# #SETLISTS
# 50.times do
#   setlist = Setlist.create(artist: Artist.all.sample, content: Faker::Lorem.paragraph(2))
# end
