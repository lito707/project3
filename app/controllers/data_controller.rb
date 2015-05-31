class DataController < ApplicationController

	# displays data by a certain field
	def by_field
  	@field = params[:field].to_s
  	@date = params[:date]
  	@data_array=[]

		# check whether the field is a postcode
  	if @field.is_integer?
  		@title="by Postcode"

  		if Postcode.all.find_by(code_id: @field)==nil
  			flash[:notice] = "Postcode not available"
  		else
  			postcodes=Postcode.all.find_by(code_id: @field)
  			#postcodes.locations
  			@locations=Location.all.where(postcode_id: postcodes.id)

  			@locations.each_with_index  do |loc,index|
  				@data_array<<Datum.new.get_last_data(loc,@date)
  			end
  			@data_array=@data_array.flatten
  		end

  	else

  		@title="by Location"
  		if Location.all.find_by(location_id: @field)==nil
  			flash[:notice] = "Location not available"

  		else
  			location=Location.all.find_by(location_id: @field)
  			@data_array=Datum.new.get_last_data(location,@date)
  		end

  	end

  end

end

class String

	def is_integer?
		self.to_i.to_s == self
	end
end
