# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 #Airport.create!( code: 'SFO' )

 Airport.delete_all
 airports = Airport.create([{ code: 'SFO' }, { code: 'MSP' },{ code: 'LAX' }, { code: 'JFK' }])

 Flight.delete_all

  def make_flight(to, from, start, duration)
    flight = Flight.create(to_airport_id: Airport.find_by(code: to).id,
              from_airport_id: Airport.find_by(code: from).id,
              start: DateTime.parse(start), duration: duration)
    flight.save
  end
  (1..2).each do |m|
    (1..28).each do |d|
      make_flight("MSP", "JFK", "2017/#{m}/#{d} 10:20", 4)
      make_flight("MSP", "SFO", "2017/#{m}/#{d} 5:30", 4)
      make_flight("MSP", "LAX", "2017/#{m}/#{d} 3:00", 5)

      make_flight("SFO", "JFK", "2017/#{m}/#{d} 4:25", 4)
      make_flight("SFO", "LAX", "2017/#{m}/#{d} 3:00", 5)
      make_flight("SFO", "MSP", "2017/#{m}/#{d} 3:00", 5)

      make_flight("LAX", "JFK", "2017/#{m}/#{d} 3:00", 5)
      make_flight("LAX", "SFO", "2017/#{m}/#{d} 3:00", 5)
      make_flight("LAX", "MSP", "2017/#{m}/#{d} 3:00", 5)

      make_flight("JFK", "MSP", "2017/#{m}/#{d} 10:20", 4)
      make_flight("JFK", "SFO", "2017/#{m}/#{d} 5:30", 4)
      make_flight("JFK", "LAX", "2017/#{m}/#{d} 3:00", 5)
    end
  end
