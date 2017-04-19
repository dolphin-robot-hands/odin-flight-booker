class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(id: params[:flight])
    @booking = @flight.bookings.build
    params[:number].to_i.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      @flight = Flight.find_by(id: booking_params[:flight_id])
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  private

  def booking_params
  	params.require(:booking).permit(:flight_id,
  		                              passengers_attributes: [:name, :email])
    end

end
