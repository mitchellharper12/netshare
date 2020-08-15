class AddLatLongIndexToListings < ActiveRecord::Migration[6.0]
  def change
    add_index :listings, [:latitude, :longitude]
  end
end
