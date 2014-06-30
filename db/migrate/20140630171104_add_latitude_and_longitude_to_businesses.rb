class AddLatitudeAndLongitudeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :lat, :float
    add_column :businesses, :long, :float
    add_index :businesses, [:lat, :long]
  end
end
