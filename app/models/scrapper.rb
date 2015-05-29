URL = 'http://www.bom.gov.au/vic/observations/vicall.shtml'

CARDINAL_TO_DEGREES = {"CALM"=>0, "N"=>0, "NNE"=>22, "NE"=>45, "ENE"=>67, "E"=>90, "ESE"=>112, "SE"=>135, "SSE"=>157, "S"=>180, "SSW"=>202, "SW"=>225, "WSW"=>247, "W"=>270, "WNW"=>292, "NW"=>315, "NNW"=>337}
FIELDS=['-tmp','-rainsince9am']
#FIELDS2=['-wind -obs-wind-dir'','-wind-spd-kmh']


require 'nokogiri'
require 'open-uri'
require 'json'

class Scrapper < ActiveRecord::Base

	def read_bom(location)		
		doc = Nokogiri::HTML(open(URL))
		temp_array = []
		elements = {}
		name=location
		zone=name.split(/-/).first



		FIELDS.each_with_index do |category, index|			
			
			s = '#'+ zone +' tbody td[headers="'+ zone + category + ' ' + name + '"]'
			temp_array[index] = doc.css(s).text
		end
		s = '#'+ zone +' tbody td[headers="'+ zone + '-wind '+ zone + '-wind-dir ' + name + '"]'
		temp_array[2] = doc.css(s).text
		s = '#'+ zone +' tbody td[headers="'+ zone + '-wind '+ zone +'-wind-spd-kmh ' + name + '"]'
		temp_array[3] = doc.css(s).text

		elements[:temp]= temp_array[0]
		elements[:wind_dir]= CARDINAL_TO_DEGREES[temp_array[2]]
		elements[:wind_speed]= temp_array[3]
		elements[:rain]= temp_array[1]

		return elements
	end
end
