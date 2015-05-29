class DataController < ApplicationController
  def retrieve_data code_id, date

  	#return Hash
  end

  def get_location_data code_id

  	#return hash
  end

  def by_location_id

  	@location_id = params[:location_id]
  	@date = params[:date]
  	location=Location.all.find_by(location_id: @location_id)
  	@data_array=Datum.new.get_last_data(location,@date)
  	
  	@last_temperature=@data_array.last.temperature
  	a=Array.new
  	a[0]=@date
  	a[1]=@last_temperature.to_s

  	#http://localhost:3000/weather/data/3/27-5-2015
  	respond_to do |format|
       format.html
       format.json{ render json: @data_array.to_json(@date) }
    end

   end


    def by_postcode

    @post_code = params[:post_code].to_i 
    @date= params[:date]



    end

end
