class RemoveIndexFromBusinesses < ActiveRecord::Migration
  def change
    remove_index :businesses, [:name, :city_state_zip, :address]
  end
end
