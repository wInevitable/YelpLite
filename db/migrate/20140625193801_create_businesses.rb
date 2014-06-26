class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :city_state_zip, null: false, default: ""
      t.string :country
      t.string :phone_number
      t.string :website_url
      t.integer :owner_id, null: false
      t.boolean :recent, null: false, default: false
      t.integer :rating, default: 0
      t.integer :num_ratings, default: 0

      t.timestamps
    end

    add_index :businesses, :name
    add_index :businesses, [:name, :city_state_zip, :address], unique: true
    add_index :businesses, :city_state_zip
  end
end
