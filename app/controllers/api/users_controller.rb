class Api::UsersController < ApiController
  def index
    
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
end