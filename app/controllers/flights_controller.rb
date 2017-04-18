class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.all.map {|f| [f.start.to_date]}

    if !!params[:flight]
      temp_flight = Flight.new(flight_params)
      @number = params[:number]
      @flights = Flight.where("from_airport_id = ?",
      temp_flight.from_airport_id).where("to_airport_id = ?",
      temp_flight.to_airport_id)
      @flight_options = @flights.all.map {|f| ["#{f.from_airport.code} to
                                                #{f.to_airport.code}
                                                on #{f.start}" , f.id]}
    end
  end

  def create
    temp_flight = Flight.new(flight_params)
     flights = Flight.where("from_airport_id = ?",
              temp_flight.from_airport_id).where("to_airport_id = ?",
              temp_flight.to_airport_id)
    @flight_options = flights.all.map {|f| [f, f.id]}
    redirect_to root_path

  end

end
