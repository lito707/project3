json.prettify!
json.date @date
json.measurements (@data_array) do |data|
  json.precip data.rainfall
  json.wind_direction data.wind_direction
  json.wind_speed data.wind_speed
end
