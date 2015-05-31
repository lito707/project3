puts "locations:"
json.prettify!
json.date Date.today
json.locations (@locations) do |location|
  json.id location.location_id
  json.lat location.lat
  json.lon location.long
end
