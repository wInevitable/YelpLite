json.(user, :id, :fname, :lname, :nickname, :location, :things_i_love, :hometown, :avatar, :lat, :long, :reviews, :businesses)

json.name user_name(user)

json.created_at user.created_at.strftime('%m/%d/%Y')