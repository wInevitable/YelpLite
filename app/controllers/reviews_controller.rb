class ReviewsController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]
  before_action :require_review_author!, :only => [:edit, :update, :destroy]

  def new
    @business = Business.find(params[:business_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.author = current_user
    @business = Business.find(params[:business_id])
    @business.update_rating(@review)
    @review.business = @business

    if @review.save
      flash[:errors] = "Your review has been posted! Thanks for sharing!"
      redirect_to business_url @business
    else
      flash.now[:errors] = @review.errors.full_messages
      render :new
    end
  end

  def show
    redirect_to user_url current_user
  end

  def edit
    @review = Review.find(params[:id])
    @business = @review.business
  end

  def update
    @review = Review.find(params[:id])
    @review.business.remove_rating(@review)

    if @review.update_attributes(review_params)
      @review.business.update_rating(@review)
      flash[:errors] = "Your review has been updated! Thanks for contributing!"
      redirect_to business_url @review.business
    else
      flash.now[:errors] = @review.errors.full_messages
      render :edit
    end
  end

  def delete
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      @review.business.remove_rating(@review)
      flash[:errors] = "Your review has been removed from YelpLite."
    end
    redirect_to root_url
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
