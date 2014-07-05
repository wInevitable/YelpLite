class AddDisplayAddressToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :display_address, :string
  end
end
