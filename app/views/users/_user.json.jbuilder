json.(user, :id, :fname, :lname, :nickname, :location, :things_i_love, :hometown, :lat, :long, :reviews, :businesses)

json.name user_name(user)

json.avatar_mini user.avatar.url(:mini)
json.avatar_thumb user.avatar.url(:thumb)
json.avatar_profile user.avatar.url(:profile)

json.created_at user.created_at.strftime('%m/%d/%Y')