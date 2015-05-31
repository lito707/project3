json.prettify!

@all_data.each do |location, predictions, probabilities|
	json.location_id location.location_id
	json.predictions do
		json.set (0..@period/10).to_a.each do |j|	

		  json.rain do 
		  	json.value predictions[0][j]
		  	json.probability probabilities[0]
		  end
		  json.wind_dir do 
		  	json.value predictions[1][j]
		  	json.probability probabilities[1]
		  end
		  json.wind_speed do 
		  	json.value predictions[2][j]
		  	json.probability probabilities[2]
		  end
		  json.temp do 
		  	json.value predictions[3][j]
		  	json.probability probabilities[3]

		  end
		end
	end
end
