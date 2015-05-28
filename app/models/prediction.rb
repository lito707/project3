class Prediction < ActiveRecord::Base
	def predict_by_coordinates(lat, long, period)
		locations = get_closest_locations(lat, long)

		if locations.first[1] == 0 # Distance == 0, it matches exactly with a location of the database
			data = location_data(locations.first[0], period)

			rain_model = find_model(data[:rain])
			wind_dir_model = find_model(data[:wind_dir])
			wind_speed_model = find_model(data[:wind_speed])
			temperature_model = find_model(data[:temperature])

			a = predict(rain_model, period)
			b = predict(wind_dir_model, period)
			c = predict(wind_speed_model, period)
			d = predict(temperature_model, period)

			return [a,b,c,d]
		else
			return predict_3N(locations)
		end
	end

	def predict_3N(locations)
		sum_distances = locations.inject(0) { |sum, i| sum + locations[i][1] }

		

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
