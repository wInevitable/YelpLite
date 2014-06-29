class SessionsController < ApplicationController

  before_action :require_signed_out!, :only => [:new, :create]
  before_action :require_signed_in!, only: :destroy

  def new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )

    if @user
      sign_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = "That email/password combination is invalid. Please try again."
      render :new
    end
  end

  def facebook
    @user = User.find_or_create_by_auth_hash(request.env['omniauth.auth'])

    sign_in(@user)
    redirect_to root_url
  end

  def twitter
    @user = User.find_or_create_by_twitter_auth_hash(request.env['omniauth.auth'])

    sign_in(@user)
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
