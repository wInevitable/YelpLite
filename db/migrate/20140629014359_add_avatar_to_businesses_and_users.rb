class AddAvatarToBusinessesAndUsers < ActiveRecord::Migration
  def change
  	add_attachment :users, :avatar
  	add_attachment :businesses, :avatar
  end
end
