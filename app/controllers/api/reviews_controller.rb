module Api
  class ReviewsController < ApiController
    def index

    end

    def show
      @review = Review.find(params[:id], include: [:author, :business])

      render partial: 'reviews/review.json', locals: { review: @review }
    end
  end
end