class DataController < ApplicationController

	def retrieve_data code_id, date

  	#return Hash
  end

  def get_location_data code_id

  	#return hash
  end


  def by_location_id

  	@value = params[:parameter].to_s
  	@date = params[:date]
  	@data_array=[]


  	if @value.is_integer?
  		@title="by Postcode"

  		if Postcode.all.find_by(code_id: @value)==nil
  			flash[:notice] = "Postcode not available"
  		else
  			postcodes=Postcode.all.find_by(code_id: @value)
  			#postcodes.locations
  			@locations=Location.all.where(postcode_id: postcodes.id)

  			@locations.each_with_index  do |loc,index|
  				@data_array<<Datum.new.get_last_data(loc,@date)
  			end
  			@data_array=@data_array.flatten
  		end

  	else

  		@title="by Location"
  		if Location.all.find_by(location_id: @value)==nil
  			flash[:notice] = "Location not available"

  		else
  			location=Location.all.find_by(location_id: @value)
  			@data_array=Datum.new.get_last_data(location,@date)
  		end


  	end  	
  	#@last_temperature=@data_array.last.temperature
  	#a=Array.new
  	#a[0]=@date
  	#a[1]=@last_temperature.to_s

  	#http://localhost:3000/weather/data/tMAL-station-charlton/27-5-2015
  	#http://localhost:3000/weather/data/3960/29-5-2015
  

  end

end
class String

	def is_integer?
		self.to_i.to_s == self
	end
end