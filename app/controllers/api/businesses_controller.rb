module Api
  class BusinessesController < ApiController
    def index

    end

    def show
      @business = Business.find(params[:id], include: [reviews: :author])

      render partial: 'businesses/business.json', locals: { business: @business }
    end
  end
end