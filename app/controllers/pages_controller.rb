class PagesController < ApplicationController

  def home #home page/root_url
    @business = Business.find(:all, order: "RANDOM()", limit: 1).first #order by
  end

  def search

    if params[:query]      
      @results = PgSearch.multisearch(params[:query][:find])
                         .includes(:searchable)
                         .page(params[:page])
    end
  end
end
