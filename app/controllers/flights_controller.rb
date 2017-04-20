class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.all.map {|f| [f.start.to_date]}.uniq

    if !!params[:flight]
      temp_flight = Flight.new(flight_params)
      @number = params[:number]

      #refactor into function in model
      #@flights = Flight.where("from_airport_id = ?",
      #temp_flight.from_airport_id).where("to_airport_id = ?",
      #temp_flight.to_airport_id).where("start BETWEEN ? AND ?",
      #temp_flight.start.to_datetime.beginning_of_day, temp_flight.start.to_datetime.end_of_day)

      @flights = Flight.where("from_airport_id = ?",
      temp_flight.from_airport_id).where("to_airport_id = ?",
      temp_flight.to_airport_id).where("DATE(start) = ?",
      temp_flight.start.to_date)

      #refactor into function in model
      @flight_options = @flights.all.map {|f| ["#{f.from_airport.code} to
                                                #{f.to_airport.code}
                                                on #{f.start.to_date}" , f.id]}
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
