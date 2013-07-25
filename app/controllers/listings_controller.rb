# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController
  before_filter :authenticate_user!

  def index

    if !valid_zipcode? params[:zipcode]
      @listings = Job.search(params[:search], ip_zipcode, params[:dist])
    else
      @listings = Job.search(params[:search], params[:zipcode], params[:dist])
    end

    @coords = coords @listings

    if params[:map] == "true"
      @near = near_formatted @listings
      render "map"
    else
      @listings = @listings.paginate page: params[:page]
    end
  end

  def show
  	@listing = Job.find(params[:id])
  end

  private

    def valid_zipcode? zipcode
      params[:zipcode] && !params[:zipcode].empty? && Job.is_number?(params[:zipcode])
    end

    def near_formatted n
      return n.map do |near|
        {title: near.title, coords: [near.latitude, near.longitude],
          url: listing_path(near), company_name: near.employer.company_name}
      end
    end

    def coords listings
      c = Geocoder::Calculations.geographic_center(listings.map{ |l| [l.latitude, l.longitude]})
      if c[0].nan?
        if valid_zipcode? params[:zipcode]
          return Geocoder.coordinates(params[:zipcode])
        else
          return Geocoder.coordinates(ip_zipcode)
        end
      else
        return c
      end
    end

    def ip_zipcode
      if Rails.env.production?
        request.location.postal_code
      else
        return "65714"
      end
    end

end