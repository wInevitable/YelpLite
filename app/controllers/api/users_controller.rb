module Api
  class UsersController < ApiController
    def index

    end

    def show
      @user = User.find(params[:id], include: [reviews: :business])
      # pass in @check_review = true to parse reviews too!
      render partial: 'users/user.json', locals: { user: @user }
    end
  end
end