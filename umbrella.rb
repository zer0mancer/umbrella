require 'http'
require 'json'

#KEYS
pirate_weather_api_key = ENV.fetch('PIRATE_WEATHER_KEY')
google_location = ENV.fetch("GMAPS_KEY")


pp "Hey there!"

pp "Where are you?"
location = gets.chomp.gsub(" ","%20")

#location = "Chicago"
pp location

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + google_location

response = HTTP.get(maps_url)

raw_response = response.to_s

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_results = results.at(0)

geo = first_result.fetch("geometry")

location = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")



#pp results.class
#pp first_results.class
#pp parsed_response.keys
#pp parsed_response.results
#pp parsed_response.status









# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

# Place a GET request to the URL
raw_response = HTTP.get(pirate_weather_url)


parsed_response = JSON.parse(raw_response)

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")

puts "The current temperature is " + current_temp.to_s + "."
