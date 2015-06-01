# Authors
# Dimas Antony Chacon Salas - 659825
# Tou Lee - 656128
# David Monroy - 610346
# Jhon Manuel Portella Delgado - 680794
# ___________________________________________
# Postcode Model 
class Postcode < ActiveRecord::Base
	has_many :locations
end
