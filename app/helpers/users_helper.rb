module UsersHelper
  def user_name(user)
    user.fname + " " + user.lname[0]
  end
end
