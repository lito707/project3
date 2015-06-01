# controller for data class
class DataController < ApplicationController
	# displays data by a certain field
	def by_field
		@field = params[:field].to_s
		@date = params[:date]
		@data_array=[]

		# check whether the field is a postcode or location
		if @field.is_integer?
			@title = 'by Postcode'
  		if Postcode.all.find_by(code_id: @field) == nil
  			flash[:notice] = 'Postcode not available'
			else
				postcodes = Postcode.all.find_by(code_id: @field)
  			@locations = Location.all.where(postcode_id: postcodes.id)

  			@locations.each  do |loc|
					@data_array << [loc, Datum.new.get_data(loc, @date)]
				end
			end
		else
			@title="by Location"
			if Location.all.find_by(location_id: @field) == nil
				flash[:notice] = 'Location not available'
			else
				location=Location.all.find_by(location_id: @field)
				@data_array = Datum.new.get_data(location,@date)
				# no data available for location on certain date
				if @data_array.size == 0
					flash[:notice] = 'Data not available on that date'
				end
  		end
		end
	end
end

# helper to identify if a string is alpha or numeric
class String
	def is_integer?
		self.to_i.to_s == self
	end
end
