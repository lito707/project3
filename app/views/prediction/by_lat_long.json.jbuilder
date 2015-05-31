json.prettify!
json.lattitude @lat
json.longitude @long
json.prediction (@predictions) do |prediction|
  json.rain prediction[0]
  json.wind_speed prediction[1]
  json.wind_dir prediction[2]
  json.temperature prediction[3]
end