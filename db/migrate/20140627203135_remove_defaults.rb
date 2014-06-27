class RemoveDefaults < ActiveRecord::Migration
  def up
    change_column_default(:users, :email, nil)
    change_column_default(:users, :encrypted_password, nil)
    change_column_default(:users, :session_token, nil)
    change_column_default(:users, :fname, nil)
    change_column_default(:users, :lname, nil)
  end

  def down
    change_column_default(:users, :email, "")
    change_column_default(:users, :encrypted_password, "")
    change_column_default(:users, :session_token, "")
    change_column_default(:users, :fname, "")
    change_column_default(:users, :lname, "")
  end
end
