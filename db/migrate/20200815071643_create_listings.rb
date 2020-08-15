class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.string :latitude
      t.string :longitude
      t.integer :capacity

      t.timestamps
    end
  end
end
