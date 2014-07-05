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
      @review = Review.new(review_params)

      if @review.save
        render partial: 'reviews/review.json', locals: { review: @review }
      else
        render json: { errors: @review.errors.full_messages }, status: 422
      end
    end

    def update
      fail
      @review = Review.find(params[:id])

      if @review.update_attributes(review_params)
        render partial: 'reviews/review.kson', locals: { review: @review }
      else
        render json: { errors: @review.errors.full_messages }, status: 422
      end
    end

    private
    def review_params
      params.require(:review).permit(:rating, :content, :author_id, :business_id)
    end
  end
end