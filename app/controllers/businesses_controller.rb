class BusinessesController < ApplicationController
  
  before_action :require_signed_in!, only: [:new, :create]
  before_action :require_business_owner!, :only => [:edit, :update, :destroy]
  
  def new
    @business = Business.new
  end
  
  def create
    @business = Business.new(business_params)
    @business.owner = current_user
    
    if @business.save
      flash[:errors] = "Great, your business has been created!"
      redirect_to ('/businesses/' + @business.id.to_s)
    else
      flash.now[:errors] = @business.errors.full_messages
      render :new
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
      redirect_to ('/businesses/' + @business.id.to_s)
    else
      flash.now[:errors] = @business.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @business = Business.find(params[:id])
    @user = @business.owner
    @business.destroy
    flash[:errors] = "Your business has been removed from YelpLite. We're sorry to see you go."
    redirect_to ('/users/' + @user.id)
  end
  
  private
  def business_params
    params.require(:business).permit(:name, :address, :city_state_zip, :country,
      :phone_number, :website_url, :owner_id, :recent)
  end
end
