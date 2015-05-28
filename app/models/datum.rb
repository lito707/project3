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

end
