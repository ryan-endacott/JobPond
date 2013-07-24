# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController
  before_filter :authenticate_user!

  def index

    @coords = coords
    if !params[:zipcode] || params[:zipcode].empty?
      @listings = Job.search(params[:search], ip_zipcode, params[:dist]).paginate page: params[:page]
    else
      @listings = Job.search(params[:search], params[:zipcode], params[:dist]).paginate page: params[:page]
    end

    if params[:map] == "true"
      @near = near_formatted @listings
      render "map"
    end
  end

  def show
  	@listing = Job.find(params[:id])
  end

  private

    def near_formatted n
      nears = []
      n.each do |near|
        nears << {title: near.title, coords: [near.latitude, near.longitude],
          url: listing_path(near), company_name: near.employer.company_name}
      end
      return nears
    end

    def coords
      if Rails.env.production?
        Geocoder.coordinates(ip_zipcode)
      else
        Geocoder.coordinates("Nixa, Missouri")
      end
    end

    def ip_zipcode
      request.location.postal_code
    end

end