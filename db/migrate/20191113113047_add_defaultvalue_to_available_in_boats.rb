class AddDefaultvalueToAvailableInBoats < ActiveRecord::Migration[6.0]
  def change
    change_column :boats, :available, :boolean, default: true
  end
end
