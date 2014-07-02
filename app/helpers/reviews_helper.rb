module ReviewsHelper
  def reviews(model, n)
    reviews = []

    reviews.push(model.reviews.shuffle.take(n))

    reviews.first
  end

  def time_ago(review)
    minutes = (Time.now - review.created_at) / 60
    
    #minutes
    if minutes < 60
      "#{(minutes/60).to_i} minutes ago"
    #hours
    elsif minutes < 1440
      "#{(minutes/60/60).to_i} hours ago"
    #days
    elsif (minutes/60/60/24) < 365
      "#{(minutes/60/60/24).to_i} days ago"
    #years
    else
      "#{(minutes/60/60/24/365).to_i} years ago"
    end
  end
end
