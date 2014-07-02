class PagesController < ApplicationController

  def home #home page/root_url
    @business = Business.find(:all, order: "RANDOM()", limit: 1).first #order by
  end

  def search

    if params[:query]
      @what = params[:query][:find]
      @where = params[:query][:near]
      @how_far = 20 #dist in miles

      @businesses = Business.search_by_name(@what).near(@where, @how_far)

      @reviews = Review.search_by_content(@what).includes(:business)

      @reviews.each do |review|
        biz = review.business
        if biz.distance_from(@where) < @how_far
          @businesses.push(biz) unless @businesses.include?(biz)
        end
      end

      @results = Kaminari.paginate_array(@businesses).page(params[:page])
    end
  end

  def root
    @users = User.all
    @businesses = Business.all
    @reviews = Review.all
    
    render layout: "backbone"
  end
end
