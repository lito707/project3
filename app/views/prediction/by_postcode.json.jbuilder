json.prettify!
@locations.each_with_index do |location, i|
	json.location_id location.location_id
	json.predictions (@predictions_n_probs[i]) do |prediction|
	  json.rain prediction[0]
	  json.wind_speed prediction[1]
	  json.wind_dir prediction[2]
	  json.temperature prediction[3]
  	end
end
