class Prediction < ActiveRecord::Base

	# predict weather from a lattitude and longitude parameters for a period asked
	def predict_by_coordinates(lat, long, period)
		locations_w_dist = get_closest_locations(lat, long)

		if locations_w_dist.first[1] == 0 # Distance == 0, it matches exactly with a location of the database
			get_all_predictions(locations_w_dist.first[0], period)
		else
			results = [[],[],[],[]]
			probabilities = []

			first_prob, first_set = get_all_predictions(locations_w_dist[0][0], period)
			second_prob, second_set = get_all_predictions(locations_w_dist[1][0], period)
			third_prob, third_set = get_all_predictions(locations_w_dist[2][0], period)

			factors = get_factors(locations_w_dist)

			(0...first_set.length).to_a.each do |i|
				(0...first_set[i].length).to_a.each do |j|
					results[i][j] = (first_set[i][j]*factors[0] + second_set[i][j]*factors[1] + third_set[i][j]*factors[2])/(factors[0]+factors[1]+factors[2])
				end
				probabilities[i] = (first_prob[i]*factors[0] + second_prob[i]*factors[1] + third_prob[i]*factors[2])/(factors[0]+factors[1]+factors[2])
			end
			return probabilities, results
		end
	end

	def get_factors(locations_w_dist)
		sum_distances = (0...locations_w_dist.length).inject(0) { |sum, i| sum + locations_w_dist[i][1] }
		dist1 = locations_w_dist[0][1]
		dist2 = locations_w_dist[1][1]
		dist3 = locations_w_dist[2][1]

		return [dist1/sum_distances, dist2/sum_distances, dist3/sum_distances]
	end

	def get_all_predictions(location, period) # get an array of 4 arrays with the predicted values of wind speed, wind dir, temp and rainfall
		data = location_data(location, period)

		rain_model = find_model(data[:rain])
		wind_dir_model = find_model(data[:wind_dir])
		wind_speed_model = find_model(data[:wind_speed])
		temperature_model = find_model(data[:temperature])

		probabilities = [rain_model[:probability],wind_dir_model[:probability],wind_speed_model[:probability],temperature_model[:probability]]

		a = predict(rain_model, period).map {|x| x.round(2)}
		b = predict(wind_dir_model, period).map {|x| x.round(2)}
		c = predict(wind_speed_model, period).map {|x| x.round(2)}
		d = predict(temperature_model, period).map {|x| x.round(2)}

		return probabilities, [a,b,c,d]
	end

	def location_data(location, period)

		raw_data = {:rain=>[],:wind_dir=>[],:wind_speed=>[],:temperature=>[]}

		records = location.data.last(period)

		records.each do |record|
			raw_data[:rain] << record.rainfall
			raw_data[:wind_dir] << record.wind_direction.to_f
			raw_data[:wind_speed] << record.wind_speed
			raw_data[:temperature] << record.temperature
		end

		return raw_data

	end

	def find_model(data)
		regression = Regression.new
		return regression.best_fit(data)
	end

	def predict(model, period)
		predictions = []
		val = model[:samples_size]
		x = (val..val+(period/10)).to_a

		case model[:type]
		when 'linear'
			(0..period/10).to_a.each {|i| predictions[i] = model[:coeffs][1]*x[i] + model[:coeffs][0]}
		when 'polynomial'
			(0..period/10).to_a.each do |i|
				predictions[i] = (0..model[:degree]).reduce(0) {|sum, j| sum + (model[:coeffs][j]*(x[i]**j))}
			end
		when 'exponential'
			(0..period/10).to_a.each {|i| predictions[i] = model[:coeffs][0]*(Math::E**(model[:coeffs][1]*x[i]))}
		when 'logarithmic'
			(0..period/10).to_a.each {|i| predictions[i] = model[:coeffs][0] + (model[:coeffs][1]*Math::log(x[i]))}
		end

		return predictions
	end

	def get_closest_locations(lat, long)
		dist = {}
		closest_locations = []
		locations = Location.all

		locations.each do |location|
			dist[location] = Math::sqrt((location.lat - lat)**2 + (location.long - long)**2)
		end

		dist_in_order = dist.sort_by {|k,v| v}

		(0...3).to_a.each do |i|
			closest_locations << dist_in_order[i]
		end

		return closest_locations # Returns an array of locations and its distances [[location, distance], ...]
	end

	def get_location(lat, long)
		locations = Location.all
		return locations.find {|location| location.lat == lat && location.long == long}
	end
end
