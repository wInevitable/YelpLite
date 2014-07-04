module Api
  class UsersController < ApiController
    def index

    end

    def show
      @user = User.find(params[:id], include: [reviews: :business])

      render partial: 'users/user.json', locals: { user: @user }
    end
  end
end