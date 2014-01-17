require 'open-uri'
require 'json'

puts "Enter an origin address: "
origin = gets
origin = origin.chomp
origin.tr!(" ", "+")

puts "Enter a destination address: "
dest = gets
dest = dest.chomp
dest.tr!(" ", "+")

#maps.googleapis.com/maps/api/directions/json?origin=###&destination=###&sensor-false

json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{dest}&sensor=false").read

data = JSON.parse(json_data)

puts "Total travel time driving: #{data["routes"][0]["legs"][0]["duration"]["text"]}"
puts "Total distance traveled: #{data["routes"][0]["legs"][0]["distance"]["text"]}"

