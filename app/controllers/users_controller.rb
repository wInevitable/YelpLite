class UsersController < ApplicationController
  
  before_action :require_authorized!, :only => [:edit, :update]
  before_action :require_signed_out!, :only => [:create, :new]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
  end
  
  private  
  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname)
  end
end