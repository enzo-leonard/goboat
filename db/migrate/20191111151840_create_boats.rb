class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :photo
      t.string :category
      t.string :city
      t.integer :long
      t.integer :lat
      t.integer :price
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
