class Location < ActiveRecord::Base
	belongs_to :postcode
	has_many :data
	require('json')

	def to_json
		main_hash = {"The ID of the category is" => location.lat, "The category of the post is:" => location.long}
		return main_hash.to_json
	end


end
