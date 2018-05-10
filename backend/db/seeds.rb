require 'faker'
require 'net/http'
require 'json'
require 'pry'
require 'yaml'


key = YAML.load_file('keys2.yml')
url = "http://api.songkick.com/api/3.0/metro_areas/7644/calendar.json?apikey=#{key}&min_date=2018-05-11&max_date=2018-05-13"
uri = URI(url)
response = Net::HTTP.get(uri)
r = JSON.parse(response)

# r['Events'].each do |event|
#   if event['Artists'].length > 1
#     event['Artists'].each do |artist|
#       a = Artist.find_or_create_by(name: artist['Name'], api_artist_id: artist['Id'])
#     end
#   else
#     a = Artist.find_or_create_by(name: event['Artists'][0]['Name'], api_artist_id: event['Artists'][0]['Id'])
#   end
#     v = Venue.find_or_create_by(
#       api_venue_id: event['Venue']['Id'],
#       name: event['Venue']['Name'],
#       address: event['Venue']['Address'],
#       city: event['Venue']['City'],
#       state: event['Venue']['State'],
#       state_code: event['Venue']['StateCode'],
#       zip: event['Venue']['ZipCode'],
#       url: event['Venue']['Url'],
#       lat: event['Venue']['Latitude'],
#       long: event['Venue']['Longitude']
#     )
#     s = Show.find_or_create_by(
#       api_show_id: event['Id'],
#       showtime: event['Date'],
#       venue: v,
#       artist: a
#     )
#
# end

perPage = r["resultsPage"]["perPage"]
totalEntries = r["resultsPage"]["totalEntries"].to_f
pages = (totalEntries / perPage).ceil
page = r["resultsPage"]["page"]


if pages > 1
  while page < pages
    r["resultsPage"]["results"]["event"].each do |event|

      #create the artist
      event_artists = []
      if event["performance"].length > 1
        event["performance"].each do |set|
          ab = Artist.find_or_create_by(
            name: set["displayName"],
            songkick_url: set["artist"]["uri"],
            songkick_id: set["artist"]["id"]
          )
          event_artists << ab
          puts ab
        end
      else
        a = Artist.find_or_create_by(
          name: event["performance"][0]["displayName"],
          songkick_url: event["performance"][0]["artist"]["uri"],
          songkick_id: event["performance"][0]["artist"]["id"]
        )
        event_artists << a
        puts a
      end

      #create the venue
      v = Venue.find_or_create_by(
        songkick_id: event["venue"]["id"],
        name: event["venue"]["displayName"],
        lat: event["venue"]["lat"],
        long: event["venue"]["lng"],
        songkick_metro: event["venue"]["metroArea"]["id"],
        songkick_url: event["venue"]["uri"]
      )
      puts v

      #create the show
      if event_artists.length > 1
        event_artists.each do |artist|
          s = Show.find_or_create_by(
            artist: artist,
            venue: v,
            date: event["start"]["date"],
            time: event["start"]["time"].to_s,
            #showtime: DateTime.parse(event["start"]["datetime"]),
            songkick_popularity: event["popularity"],
            songkick_id: event["id"],
            songkick_url: event["uri"]
          )
        end
      else
        s = Show.find_or_create_by(
          artist: a,
          venue: v,
          date: event["start"]["date"],
          time: event["start"]["time"].to_s,
          #showtime: DateTime.parse(event["start"]["datetime"]),
          songkick_popularity: event["popularity"],
          songkick_id: event["id"],
          songkick_url: event["uri"]
        )
        puts s
      end

    end
    puts "finished a page!"
    puts Artist.all.count
    puts Venue.all.count
    puts Show.all.count

    puts "calling new page in 3 seconds"
    sleep 3
    page += 1
    url = "http://api.songkick.com/api/3.0/metro_areas/7644/calendar.json?apikey=#{key}&min_date=2018-05-11&max_date=2018-05-13&page=#{page}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    r = JSON.parse(response)

  end
else

  r["resultsPage"]["results"]["event"].each do |event|
    #create the artist
    event_artists = []
    if event["performance"].length > 1
      event["performance"].each do |set|
        ab = Artist.find_or_create_by(
          name: set["displayName"],
          songkick_url: set["uri"],
          songkick_id: set["id"]
        )
        event_artists << ab
        puts ab
      end
    else
      a = Artist.find_or_create_by(
        name: event["performance"]["artist"]["displayName"],
        songkick_url: event["performance"][0]["artist"]["uri"],
        songkick_id: event["performance"][0]["artist"]["id"]
      )
      event_artists << a
      puts a.songkick_url
    end

    #create the venue
    v = Venue.find_or_create_by(
      songkick_id: event["venue"]["id"],
      name: event["venue"]["displayName"],
      lat: event["venue"]["lat"],
      long: event["venue"]["lng"],
      songkick_metro: event["venue"]["metroArea"]["id"],
      songkick_url: event["venue"]["uri"]
    )
    puts v

    #create the show
    if event_artists.length > 1
      event_artists.each do |artist|
        event["start"]["datetime"]
        s = Show.find_or_create_by(
          artist: artist,
          venue: v,
          date: event["start"]["date"],
          time: event["start"]["time"],
          #showtime: DateTime.parse(event["start"]["datetime"]),
          songkick_popularity: event["popularity"],
          songkick_id: event["id"],
          songkick_url: event["uri"]
        )
        puts s
      end
    else
      puts event["start"]["datetime"]
      s = Show.find_or_create_by(
        artist: a,
        venue: v,
        date: event["start"]["date"],
        time: event["start"]["time"],
        #showtime: DateTime.parse(event["start"]["datetime"]),
        songkick_popularity: event["popularity"],
        songkick_id: event["id"],
        songkick_url: event["uri"]
      )
      puts s
    end
  end
end #ending the if statement for pages


# USERS
50.times do
  user = User.create(name: Faker::Name.unique.name, phone: 10.times.map{rand(10)}.join, email: Faker::Internet.unique.email)
end
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

# FAN
50.times do
  fan = Fan.create(user: User.all.sample, artist: Artist.all.sample)
end

#Attends
50.times do
  attends = Attend.create(user: User.all.sample, show: Show.all.sample, rating: Random.rand(1..10), checkin: Faker::Boolean.boolean)
end
#
# # setlists
# 50.times do
#   setlist = Setlist.create(artist: Artist.all.sample, content: Faker::Lorem.paragraph(2))
# end
