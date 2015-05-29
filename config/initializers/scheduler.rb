require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '10m' do

  @locations = Location.all
  @locations.each do |place|

    datum = Datum.new

    datum.set_data(place)

    datum.save
  end
end