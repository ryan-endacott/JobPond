class MarketingController < ApplicationController

	def employees

    if user_signed_in?
      flash.keep
  		redirect_to listings_path
    end

		@employee = Employee.new

    @coords = coords

    @near = near_formatted @coords
	end

  private

    def near_formatted coords
      n = Job.near(coords, 20)
      return n.map do |near|
        {title: near.title, coords: [near.latitude, near.longitude],
          url: listing_path(near), company_name: near.employer.company_name}
      end
    end

    def coords
      if Rails.env.production?
        loc = request.location
        Geocoder.coordinates("#{loc.city}, #{loc.state}")
      else
        Geocoder.coordinates("Nixa, Missouri")
      end
    end

end
