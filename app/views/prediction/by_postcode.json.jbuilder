json.prettify!
j = 0

json.array! @all_data.each do |location, predictions, probabilities|
	json.location_id location.location_id
	json.predictions do
		while j <= @period/10 do
			json.set! j*10 do
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
			j += 1
		end
	end
end
