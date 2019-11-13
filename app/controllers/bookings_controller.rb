class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.save!

    @boat = Boat.find(params[:boat_id])
    redirect_to boat_path(@boat)
  end

  private

  def booking_params
    params_user = {user_id: current_user.id}
    params_boats = {boat_id: params[:boat_id]}
    params.require(:booking).permit(:date_begin, :date_end).merge(params_boats).merge(params_user)
  end

end
