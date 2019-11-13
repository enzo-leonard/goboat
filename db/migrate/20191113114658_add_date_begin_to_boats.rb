class AddDateBeginToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :date_begin, :date
  end
end
