class ChangeUserToNullTrue < ActiveRecord::Migration
  def up
    change_column_null(:users, :encrypted_password, true)
    change_column_null(:users, :email, true)
    change_column_null(:users, :fname, true)
    change_column_null(:users, :lname, true)
  end
  
  def down
    change_column_null(:users, :encrypted_password, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :fname, false)
    change_column_null(:users, :lname, false)
  end
end
