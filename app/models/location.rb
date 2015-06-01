# Authors
# Dimas Antony Chacon Salas - 659825
# Tou Lee - 656128
# David Monroy - 610346
# Jhon Manuel Portella Delgado - 680794
# ___________________________________________
# Location Model 
class Location < ActiveRecord::Base
	belongs_to :postcode
	has_many :data
end
