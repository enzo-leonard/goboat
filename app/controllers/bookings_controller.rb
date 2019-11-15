class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.save!

    @boat = Boat.find(params[:boat_id])
    #redirect_to boat_path(@boat)
  end

  private

  def booking_params
    params_user = {user_id: current_user.id}
    params_boats = {boat_id: params[:boat_id]}
    params_dates = {date_begin: params[:daterange].split('-')[0], date_end: params[:daterange].split('-')[1]}
    params.require(:booking).permit(:price).merge(params_boats).merge(params_user).merge(params_dates)
  end

end
