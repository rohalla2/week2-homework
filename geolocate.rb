require 'open-uri'
require 'json'

#Accept user input
puts "Enter an address, city or zipcode: "
address = gets

#Clean user input
address = address.chomp
address.tr!(" ", "+")

#make API request and get json data
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data = JSON.parse(json_data)

#parse out desired info to return to user
data = data["results"][0]["geometry"]["location"]
puts "Latitude: #{data["lat"]}"
puts "Longitude: #{data["lng"]}"
