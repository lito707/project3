json.prettify!
json.date Date.today.strftime("%d-%m-%Y")
json.locations (@locations) do |location|
  json.id location.location_id
  json.lat location.lat
  json.lon location.long
  json.last_update location.updated_at.strftime("%I:%M%p %d-%m-%Y")
end
