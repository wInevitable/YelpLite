class ReviewsController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]
  before_action :require_review_owner!, :only => [:edit, :update, :destroy]

  def new
    @business = Business.find(params[:business_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:errors] = "Great, your review has been posted! Thanks for sharing!"
      redirect_to :back
    else
      flash.now[:errors] = @review.errors.full_messages

    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)

    else
      flash.now[:errors] = @review.errors.full_messages

    end
  end

  def delete
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:errors] = "Your review has been removed from YelpLite."
    redirect_to :back
  end

  private
  def review_params
    params.require(:require).permit(:content, :rating)
  end
end
