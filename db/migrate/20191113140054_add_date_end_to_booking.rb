class AddDateEndToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :date_end, :date
  end
end
