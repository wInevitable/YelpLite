module Api
  class UsersController < ApiController
    def index

    end

    def show
      @user = User.find(params[:id], include: [reviews: :business])

      render partial: 'users/users.json'
    end
  end
end