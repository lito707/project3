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

	def compute_condition


		return string
	end

	def get_last_data

		@Datum=Datum.new
		return @Datum.last
	end 
	def to_json(date)

	measurements_details = {'time' => a[1], 'temp' => temperature, 'precip' => rainfall, 'wind_direction' => wind_direction, 'wind_speed' => wind_speed }
	data_details = {'date' => date, 'current_temp' => a[2] , 'current_cond' => 'sunny', 'measurements' => measurements_details}	

	return data_details.to_json 	 
	end

end
