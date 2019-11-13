class AddDateBeginToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_begin, :date
  end
end
