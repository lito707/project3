# Authors
# Dimas Antony Chacon Salas - 659825
# Tou Lee - 656128
# David Monroy - 610346
# Jhon Manuel Portella Delgado - 680794
# ___________________________________________
# This Datum Model has climate data
class Datum < ActiveRecord::Base
	belongs_to :location

	# saves data from a location
	def set_data(location)
		scrapper = Scrapper.new
		self.location_id = location.id
		elements = scrapper.read_bom(location.location_id)
		self.temperature = elements[:temp]
		self.rainfall = elements[:rain]
		self.wind_direction = elements[:wind_dir]
		self.wind_speed = elements[:wind_speed]
	end

	# set the condtion from a location asked
	def set_condition(location)
		date = Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s
		last_data = get_data(location, date)
		self.current_condition = compute_condition(last_data)
	end

	# according to some weather data parameter determine the condition
	def compute_condition(data)
		rain = self.rainfall
		wind = self.wind_speed
		temp = self.temperature
		if !data[-2].nil?
			previous_rain = data[-2].rainfall
		else
			previous_rain = rain
		end
		cond = 'clear'
		if (rain - previous_rain) > 0
			cond = 'rainy'
			if wind > 50
				cond = 'stormy'
				if temp < -10
					cond = 'blizzard'
				end
			elsif temp < 0
				cond = 'snowy'
			end
			return cond
		end
		if wind > 10
			cond = 'breezy'
			if  wind > 35
				cond = 'windy'
			end
			return cond
		end

		if temp < 10
			cond = 'cloudy'
		elsif Time.now.hour < 17 && Time.now.hour > 7 #Assuming winter season
			cond = 'sunny'
		end
		return cond
	end

	# retrieve data entry from a location on a certain date
	def get_data(location, date)
		d=date.split(/-/)
	  	true_date=Date.new(d[2].to_i,d[1].to_i,d[0].to_i)
	  	data=Datum.where(["created_at >= ? AND created_at <= ?",true_date.beginning_of_day, true_date.end_of_day])
	  	return data_array=data.where(location_id: location.id)
	end
end
