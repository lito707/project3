json.prettify!
j = 0
if flash[:notice]
	json.warning flash[:notice]
	flash[:notice] = nil
else
	json.array! @all_data.each do |location, predictions, probabilities|
		json.location_id location.location_id
		json.predictions do
			while j <= @period/10 do
				json.set! j*10 do
					json.time (Time.now+(j*10).minute).strftime("%I:%M%p %d-%m-%Y")
					json.rain do
						json.value predictions[0][j]
						if j == 0
							json.probability 1
						else
							json.probability probabilities[0]
						end
					end
					json.wind_dir do
						json.value predictions[1][j]
						if j == 0
							json.probability 1
						else
							json.probability probabilities[1]
						end
					end
					json.wind_speed do
						json.value predictions[2][j]
						if j == 0
							json.probability 1
						else
							json.probability probabilities[2]
						end
					end
					json.temp do
						json.value predictions[3][j]
						if j == 0
							json.probability 1
						else
							json.probability probabilities[3]
						end
					end
				end
				j += 1
			end
			j = 0
		end
	end
end
