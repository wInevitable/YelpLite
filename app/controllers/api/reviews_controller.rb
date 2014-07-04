module Api
  class ReviewsController < ApiController
    def index
      if (params[:business_id])
        @business = Business.find(params[:business_id], include: :reviews)
        @reviews = @business.reviews
      else
        @user = User.find(params[:user_id], include: :reviews)
        @reviews = @user.reviews
      end

      render partial: 'reviews/reviews.json'
    end

    def show
      @review = Review.find(params[:id], include: [:author, :business])

      render partial: 'reviews/review.json', locals: { review: @review }
    end

    def create

    end

    def update
      @review = Review.find()
    end
  end
end