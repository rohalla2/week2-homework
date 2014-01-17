require 'open-uri'
require 'json'

#accept user input
puts "Enter an address, city or zipcode: "
address = gets

#clean user input
address = address.chomp
address.tr!(" ", "+")

#fetch google api data
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data = JSON.parse(json_data)

#parse out lat and long of address
data = data["results"][0]["geometry"]["location"]
lat = data["lat"]
lng = data["lng"]

#use openweathermap api to fetch weather at lat,long
weather_json = open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}").read
weather_data = JSON.parse(weather_json)

#calculate F temp from K
temp = ((weather_data["main"]["temp"] - 273) * 1.8) + 32
temp = temp.round(1)

#return temp in f
puts "#{temp}f"