module Api
  class UsersController < ApiController
    def index

    end

    def show
      @user = User.find(params[:id], include: [:reviews, :businesses])

      render json: @user
    end
  end
end