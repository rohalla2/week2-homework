require 'open-uri'
require 'json'

puts "Enter an address, city or zipcode: "
address = gets
address = address.chomp

address.tr!(" ", "+")

json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read

data = JSON.parse(json_data)


data = data["results"][0]["geometry"]["location"]

lat = data["lat"]
lng = data["lng"]

weather_json = open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}").read

weather_data = JSON.parse(weather_json)

temp = ((weather_data["main"]["temp"] - 273) * 1.8) + 32

temp = temp.round(1)

puts "#{temp}f"


#api.openweathermap.org/data/2.5/weather?lat=35&lon=139