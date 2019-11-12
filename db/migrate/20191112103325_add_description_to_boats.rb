class AddDescriptionToBoats < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :description, :text
  end
end
