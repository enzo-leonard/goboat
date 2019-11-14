class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :input
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
