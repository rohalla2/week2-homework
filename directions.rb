require 'open-uri'
require 'json'

#accept user input
puts "Enter an origin address: "
origin = gets

#clean user input
origin = origin.chomp
origin.tr!(" ", "+")

#accept user input
puts "Enter a destination address: "
dest = gets

#clean user input
dest = dest.chomp
dest.tr!(" ", "+")

#fetch api data
json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{dest}&sensor=false").read
data = JSON.parse(json_data)

#display desired data points
puts "Total travel time driving: #{data["routes"][0]["legs"][0]["duration"]["text"]}"
puts "Total distance traveled: #{data["routes"][0]["legs"][0]["distance"]["text"]}"

