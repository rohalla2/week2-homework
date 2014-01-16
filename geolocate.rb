require 'open-uri'
require 'json'

puts "Enter an address, city or zipcode: "
address = gets
address = address.chomp

address.tr!(" ", "+")

json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read

data = JSON.parse(json_data)


data = data["results"][0]["geometry"]["location"]

puts "Latitude: #{data["lat"]}"
puts "Longitude: #{data["lng"]}"
