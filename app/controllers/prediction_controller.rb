class PredictionController < ApplicationController
  def by_lat_long
  	@lat = params[:lat].to_f
  	@long = params[:long].to_f
  	@period = params[:period].to_i

  	pred = Prediction.new
  	
  	@probabilities, @predictions = pred.predict_by_coordinates(@lat, @long, @period)
  end

  def by_postcode
  	@postcode = params[:post_code]
  	@period = params[:period]

  	@locations = Location.all
  end
end
