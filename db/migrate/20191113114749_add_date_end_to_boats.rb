class AddDateEndToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :date_end, :date
  end
end
