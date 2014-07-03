json.users do
  json.partial! 'users/user', user: @user
end