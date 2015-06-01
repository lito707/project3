class PredictionController < ApplicationController
  #predict for a specific latitude and longitude
  def by_lat_long
  	@lat = params[:lat].to_f
  	@long = params[:long].to_f
  	@period = params[:period].to_i
  	pred = Prediction.new
  	@predictions, @probabilities = pred.predict_by_coordinates(@lat, @long, @period)

  end

  #predict for the locations belonging to a postcode
  def by_postcode
  	code = params[:post_code].to_i
    #amount of periods to make a prediction
  	@period = params[:period].to_i
    # find the postcode id for a postcode(code_id)
  	@postcode = Postcode.all.find_by(code_id: code)
    @all_data = []
    @postcode.locations.each do |location|
      @all_data << [location].concat(Prediction.new.predict_by_coordinates(location.lat, location.long, @period))
    end
  end
end
