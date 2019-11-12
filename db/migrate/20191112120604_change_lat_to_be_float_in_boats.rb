class ChangeLatToBeFloatInBoats < ActiveRecord::Migration[6.0]
  def change
    change_column :boats, :lat, :float
    change_column :boats, :long, :float
  end
end
