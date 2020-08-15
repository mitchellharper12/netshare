class AddLattitudeAndLongitudeToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :latitude, :string
    add_column :requests, :longitude, :string
    add_index :requests, [:latitude, :longitude]
  end
end
