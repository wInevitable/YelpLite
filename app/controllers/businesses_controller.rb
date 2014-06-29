class BusinessesController < ApplicationController

  before_action :require_signed_in!, only: [:new, :create]
  before_action :require_business_owner!, :only => [:edit, :update, :destroy]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.owner = current_user

    if (params[:business][:review] == "true")
      @review = Review.new(review_params)
      @review.business = @business
      @review.author = current_user

      if (@review.valid? && @business.valid?)
        @review.save
        @business.save
        @business.update_rating(@review)
        flash[:errors] = "Great, your business and review have been added to YelpLite!"
        redirect_to business_url @business
      elsif @business.valid?
        @review.save
        flash[:errors] = @review.errors.full_messages
        redirect_to :back
      elsif @review.valid?
        @business.save
        flash[:errors] = @business.errors.full_messages
        redirect_to :back
      else #neither was valid
        flash[:errors] = @business.errors.full_messages, @review.errors.full_messages
        redirect_to :back
      end
    elsif @business.save
      flash[:errors] = "Great, your business has been created!"
      redirect_to business_url @business
    else
      flash[:errors] = @business.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])

    if @business.update_attributes(business_params)
      flash[:errors] = "Great, your business' profile has been updated!"
      redirect_to business_url @business
    else
      flash.now[:errors] = @business.errors.full_messages
      render :edit
    end
  end

  def delete
    @business = Business.find(params[:id])
  end

  def destroy
    @business = Business.find(params[:id])
    @user = @business.owner
    if @business.destroy
      flash[:errors] = "Your business has been removed from YelpLite. We're sorry to see you go."
    end
    redirect_to user_url @user
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :city_state_zip, :country,
      :phone_number, :website_url, :owner_id, :recent, :avatar)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
