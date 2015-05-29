# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
postcode_array=[3000,3028,3040,3045,3084,3179,3194,3199,3219,3225,3231,3272,3280,3284,3300,3305,3311,3318,3331,3342,
				3350,3351,3380,3396,3400,3418,3444,3500,3507,3550,3585,3616,3619,3630,3663,3676,3685,3690,3699,3713,
				3723,3730,3741,3764,3770,3786,3796,3820,3833,3844,3852,3862,3875,3885,3887,3888,3889,3891,3892,3898,
				3920,3923,3960,3971,3995,3996]
location_array=[{"lat"=>-36.28,"long"=>143.33,"location_id"=>"tMAL-station-charlton","postcode_id"=>10},
				{"lat"=>-35.72,"long"=>142.36,"location_id"=>"tMAL-station-hopetoun-airport","postcode_id"=>24},
				{"lat"=>-34.24,"long"=>142.09,"location_id"=>"tMAL-station-mildura","postcode_id"=>28},
				{"lat"=>-35.38,"long"=>143.54,"location_id"=>"tMAL-station-swan-hill","postcode_id"=>31},
				{"lat"=>-35.12,"long"=>142.00,"location_id"=>"tMAL-station-walpeup-rs","postcode_id"=>29},
				{"lat"=>-37.02,"long"=>141.27,"location_id"=>"tWIM-station-edenhope","postcode_id"=>18},
				{"lat"=>-36.67,"long"=>142.17,"location_id"=>"tWIM-station-horsham","postcode_id"=>25},
				{"lat"=>-36.31,"long"=>141.65,"location_id"=>"tWIM-station-nhill-aerodrome","postcode_id"=>26},
				{"lat"=>-37.07,"long"=>142.74,"location_id"=>"tWIM-station-stawell","postcode_id"=>23},
				{"lat"=>-38.43,"long"=>141.54,"location_id"=>"tSW-station-cape-nelson","postcode_id"=>22},
				{"lat"=>-38.86,"long"=>143.51,"location_id"=>"tSW-station-cape-otway","postcode_id"=>65},
				{"lat"=>-37.58,"long"=>141.33,"location_id"=>"tSW-station-casterton","postcode_id"=>17},
				{"lat"=>-37.65,"long"=>142.06,"location_id"=>"tSW-station-hamilton","postcode_id"=>15},
				{"lat"=>-38.07,"long"=>142.77,"location_id"=>"tSW-station-mortlake","postcode_id"=>12},
				{"lat"=>-38.23,"long"=>143.79,"location_id"=>"tSW-station-mount-gellibrand","postcode_id"=>47},
				{"lat"=>-37.30,"long"=>142.60,"location_id"=>"tSW-station-mount-william","postcode_id"=>20},
				{"lat"=>-38.39,"long"=>142.23,"location_id"=>"tSW-station-port-fairy","postcode_id"=>14},
				{"lat"=>-38.31,"long"=>141.47,"location_id"=>"tSW-station-portland-airport","postcode_id"=>16},
				{"lat"=>-38.29,"long"=>142.45,"location_id"=>"tSW-station-warrnambool","postcode_id"=>13},
				{"lat"=>-37.71,"long"=>142.94,"location_id"=>"tSW-station-westmere","postcode_id"=>22},
				{"lat"=>-38.46,"long"=>144.09,"location_id"=>"tCEN-station-aireys-inlet","postcode_id"=>11},
				{"lat"=>-37.51,"long"=>143.79,"location_id"=>"tCEN-station-ballarat","postcode_id"=>21},
				{"lat"=>-38.36,"long"=>145.18,"location_id"=>"tCEN-station-cerberus","postcode_id"=>61},
				{"lat"=>-37.72,"long"=>145.41,"location_id"=>"tCEN-station-coldstream","postcode_id"=>45},
				{"lat"=>-37.73,"long"=>144.91,"location_id"=>"tCEN-station-essendon-airport","postcode_id"=>3},
				{"lat"=>-37.87,"long"=>145.35,"location_id"=>"tCEN-station-ferny-creek","postcode_id"=>46},
				{"lat"=>-38.15,"long"=>145.12,"location_id"=>"tCEN-station-frankston","postcode_id"=>8},
				{"lat"=>-38.17,"long"=>144.38,"location_id"=>"tCEN-station-geelong-racecourse","postcode_id"=>9},
				{"lat"=>-37.86,"long"=>144.76,"location_id"=>"tCEN-station-laverton","postcode_id"=>2},
				{"lat"=>-37.67,"long"=>144.83,"location_id"=>"tCEN-station-melbourne-airport","postcode_id"=>4},
				{"lat"=>-37.83,"long"=>144.98,"location_id"=>"tCEN-station-melbourne-olympic-park","postcode_id"=>1},
				{"lat"=>-37.98,"long"=>145.10,"location_id"=>"tCEN-station-moorabbin-airport","postcode_id"=>7},
				{"lat"=>-38.63,"long"=>145.81,"location_id"=>"tCEN-station-pound-creek","postcode_id"=>66},
				{"lat"=>-38.46,"long"=>145.31,"location_id"=>"tCEN-station-rhyll","postcode_id"=>62},
				{"lat"=>-37.87,"long"=>145.26,"location_id"=>"tCEN-station-scoresby","postcode_id"=>6},
				{"lat"=>-37.91,"long"=>144.13,"location_id"=>"tCEN-station-sheoaks","postcode_id"=>19},
				{"lat"=>-37.74,"long"=>145.10,"location_id"=>"tCEN-station-viewbank","postcode_id"=>5},
				{"lat"=>-36.74,"long"=>144.33,"location_id"=>"tNCY-station-bendigo","postcode_id"=>30},
				{"lat"=>-36.34,"long"=>145.06,"location_id"=>"tNCY-station-kyabram","postcode_id"=>33},
				{"lat"=>-36.89,"long"=>145.19,"location_id"=>"tNCY-station-mangalore","postcode_id"=>35},
				{"lat"=>-37.02,"long"=>144.52,"location_id"=>"tNCY-station-redesdale","postcode_id"=>27},
				{"lat"=>-36.43,"long"=>145.39,"location_id"=>"tNCY-station-shepparton","postcode_id"=>34},
				{"lat"=>-36.44,"long"=>145.27,"location_id"=>"tNCY-station-tatura","postcode_id"=>32},
				{"lat"=>-36.03,"long"=>146.03,"location_id"=>"tNCY-station-yarrawonga","postcode_id"=>42},
				{"lat"=>-36.07,"long"=>146.95,"location_id"=>"tNE-station-albury","postcode_id"=>38},
				{"lat"=>-36.87,"long"=>147.28,"location_id"=>"tNE-station-falls-creek","postcode_id"=>39},
				{"lat"=>-37.15,"long"=>146.44,"location_id"=>"tNE-station-mount-buller","postcode_id"=>41},
				{"lat"=>-37.05,"long"=>147.33,"location_id"=>"tNE-station-mount-hotham-airport","postcode_id"=>43},
				{"lat"=>-36.98,"long"=>147.13,"location_id"=>"tNE-station-mount-hotham-aws","postcode_id"=>43},
				{"lat"=>-36.10,"long"=>146.51,"location_id"=>"tNE-station-rutherglen-rs","postcode_id"=>37},
				{"lat"=>-36.42,"long"=>146.31,"location_id"=>"tNE-station-wangaratta","postcode_id"=>36},
				{"lat"=>-37.21,"long"=>145.84,"location_id"=>"tNC-station-eildon-fire-tower","postcode_id"=>40},
				{"lat"=>-37.38,"long"=>144.97,"location_id"=>"tNC-station-kilmore-gap","postcode_id"=>44},
				{"lat"=>-38.12,"long"=>147.13,"location_id"=>"tWSG-station-east-sale","postcode_id"=>51},
				{"lat"=>-38.21,"long"=>146.47,"location_id"=>"tWSG-station-latrobe-valley","postcode_id"=>50},
				{"lat"=>-37.84,"long"=>146.27,"location_id"=>"tWSG-station-mount-baw-baw","postcode_id"=>49},
				{"lat"=>-37.75,"long"=>147.14,"location_id"=>"tWSG-station-mount-moornapa","postcode_id"=>52},
				{"lat"=>-38.13,"long"=>145.99,"location_id"=>"tWSG-station-warragul-nilma-north","postcode_id"=>61},
				{"lat"=>-39.13,"long"=>146.42,"location_id"=>"tWSG-station-wilsons-promontory","postcode_id"=>63},
				{"lat"=>-38.81,"long"=>146.19,"location_id"=>"tWSG-station-yanakie","postcode_id"=>63},
				{"lat"=>-38.56,"long"=>146.75,"location_id"=>"tWSG-station-yarram-airport","postcode_id"=>64},
				{"lat"=>-37.88,"long"=>147.57,"location_id"=>"tEG-station-bairnsdale","postcode_id"=>53},
				{"lat"=>-37.34,"long"=>149.02,"location_id"=>"tEG-station-combienbar","postcode_id"=>57},
				{"lat"=>-37.57,"long"=>149.92,"location_id"=>"tEG-station-gabo-island","postcode_id"=>58},
				{"lat"=>-37.22,"long"=>148.26,"location_id"=>"tEG-station-gelantipy","postcode_id"=>54},
				{"lat"=>-37.60,"long"=>149.73,"location_id"=>"tEG-station-mallacoota","postcode_id"=>59},
				{"lat"=>-37.69,"long"=>148.09,"location_id"=>"tEG-station-mount-nowa-nowa","postcode_id"=>55},
				{"lat"=>-37.10,"long"=>147.60,"location_id"=>"tEG-station-omeo","postcode_id"=>60},
				{"lat"=>-37.69,"long"=>148.47,"location_id"=>"tEG-station-orbost","postcode_id"=>56},]
postcode_array.each do |p|
	postcode=Postcode.new
	postcode.code_id = p
	postcode.save
end



location_array.each do |l|
	location = Location.new
	location.location_id = l["location_id"]
	location.lat = l["lat"]
	location.long = l["long"]
	location.postcode_id = l["postcode_id"]
	location.save 
end

