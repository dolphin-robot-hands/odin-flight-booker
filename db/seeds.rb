# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 #Airport.create!( code: 'SFO' )

 Airport.delete_all
 airports = Airport.create([{ code: 'SFO' }, { code: 'MSP' },{ code: 'LAX' }, { code: 'NYC' }])

 Flight.delete_all

  def make_flight(to, from, start, duration)
    flight = Flight.create(to_airport_id: Airport.find_by(code: to).id,
              from_airport_id: Airport.find_by(code: from).id,
              start: DateTime.parse(start), duration: duration)
    flight.save
  end

  (1..10).each do |d|
    make_flight("MSP", "NYC", "2017/3/#{d} 10:00", 4)
    make_flight("NYC", "MSP", "2017/3/#{d} 5:00", 4)
    make_flight("NYC", "SFO", "2017/3/#{d} 3:00", 5)
    make_flight("SFO", "NYC", "2017/3/#{d} 11:00", 5)
  end
