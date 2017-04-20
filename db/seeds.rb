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
    flight = Flight.create(from_airport_id: Airport.find_by(code: to).id,
              to_airport_id: Airport.find_by(code: from).id,
              start: DateTime.parse(start), duration: duration)
    flight.save
  end
(17..18).each do |y|
  (1..12).each do |m|

    case m
    when 1, 3, 5, 7, 8, 10, 12
      z = 31
    when 4, 6, 9, 11
      z = 30
    else
      z= 28
    end

    (1..z).each do |d|

      (1..rand(3..6)).each do 

        h = rand(1..12)
        mi = rand(10..55)

        make_flight("MSP", "JFK", "20#{y}/#{m}/#{d} #{h}:#{mi}", 4)
        make_flight("MSP", "SFO", "20#{y}/#{m}/#{d} #{h}:#{mi}", 4)
        make_flight("MSP", "LAX", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)

        make_flight("SFO", "JFK", "20#{y}/#{m}/#{d} #{h}:#{mi}", 4)
        make_flight("SFO", "LAX", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)
        make_flight("SFO", "MSP", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)

        make_flight("LAX", "JFK", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)
        make_flight("LAX", "SFO", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)
        make_flight("LAX", "MSP", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)

        make_flight("JFK", "MSP", "20#{y}/#{m}/#{d} #{h}:#{mi}", 4)
        make_flight("JFK", "SFO", "20#{y}/#{m}/#{d} #{h}:#{mi}", 4)
        make_flight("JFK", "LAX", "20#{y}/#{m}/#{d} #{h}:#{mi}", 5)
      end
    end
  end
end
