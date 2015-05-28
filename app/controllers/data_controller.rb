class DataController < ApplicationController
  def retrieve_data code_id, date

  	#return Hash
  end

  def get_location_data code_id

  	#return hash
  end

  def by_location_id

  	@location_id = params[:location_id].to_i
  	@date = params[:date]
  	temporal=@date.split(/-/)
  	true_date=Date.new(temporal[2].to_i,temporal[1].to_i,temporal[0].to_i)
  	temp=Datum.where(["created_at >= ? AND created_at <= ?",true_date.beginning_of_day, true_date.end_of_day])
  	@data_array=temp.where(location_id: @location_id)

  	#http://localhost:3000/weather/data/3/27-5-2015
  	respond_to do |format|
       format.html
       format.json{ render json: @data_array}
     end



  end

end
