require 'json'

class Datum < ActiveRecord::Base
	belongs_to :location

	def set_data(location)
		scrapper = Scrapper.new

		self.location_id = location.id

		elements = scrapper.read_bom(location.location_id)

		self.temperature = elements[:temp]
		self.rainfall = elements[:rain]
		self.wind_direction = elements[:wind_dir]
		self.wind_speed = elements[:wind_speed]


	end

	def set_condition(location)
		date = Time.now.day.to_s+'-'+Time.now.month.to_s+'-'+Time.now.year.to_s
		last_data = get_last_data(location, date)

		self.current_condition = compute_condition(last_data)
	end

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

	def get_last_data(location, date)
		temporal=date.split(/-/)
	  	true_date=Date.new(temporal[2].to_i,temporal[1].to_i,temporal[0].to_i)
	  	temp=Datum.where(["created_at >= ? AND created_at <= ?",true_date.beginning_of_day, true_date.end_of_day])
	  	
	  	return data_array=temp.where(location_id: location.id)
	end

	def to_json(date)
		measurements_details = {'time' => created_at.strftime("%I:%M:%S %p"), 'temp' => temperature, 'precip' => rainfall, 'wind_direction' => wind_direction, 'wind_speed' => wind_speed }
		data_details = {'date' => date, 'current_temp' => a[2] , 'current_cond' => 'sunny', 'measurements' => measurements_details}	

		return data_details.to_json 	 
	end

end
