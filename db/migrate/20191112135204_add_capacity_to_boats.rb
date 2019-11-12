class AddCapacityToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :capacity, :integer
  end
end
