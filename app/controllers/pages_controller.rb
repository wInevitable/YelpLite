require 'flickr'

class PagesController < ApplicationController
  include Yelp::V2::Search::Request

  def home #home page/root_url
    @business = Business.find(:all, order: "RANDOM()", limit: 1).first #order by
  end

  # def yelp
  #   client = Yelp::Client.new
  #   fake_city = 'San Francisco'
  #
  #   request = Location.new(
  #               term: 'seafood',
  #               city: fake_city
  #             )
  #   @response = client.search(request)
  #   fail
  # end
  #
  # def flicker
  #   flickr = Flickr.new(
  #     api_key: ENV['FLICKR_KEY'],
  #     shared_secret: ENV['FLICKR_SECRET'],
  #     tags: 'people'
  #   )
  #   @photos = flickr.photos
  #   fail
  # end

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

      @names = []
      @addresses = []
      @results.each do |result|
        @addresses.push(result.full_address)
        @names.push(result.name)
      end
    end
  end

  def root
    @user = current_user
    @business = Business.order("RANDOM()").first
    @reviews = Review.order(created_at: :desc).first(5)

    render layout: "backbone"
  end
end
