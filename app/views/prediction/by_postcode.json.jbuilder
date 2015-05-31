json.prettify!

@locations.each_with_index do |location, i|
	json.location_id location.location_id
	json.predictions do
		json.set (0..@period/10).to_a.each do |j|	
		  json.rain do 
		  	json.value @predictions[i][0][j]
		  	json.probability @probabilities[i][0]
		  end
		  json.wind_dir do 
		  	json.value @predictions[i][1][j]
		  	json.probability @probabilities[i][0]
		  end
		  json.wind_speed do 
		  	json.value @predictions[i][2][j]
		  	json.probability @probabilities[i][0]
		  end
		  json.temp do 
		  	json.value @predictions[i][3][j]
		  	json.probability @probabilities[i][0]
		  end
		end
  	end
end
