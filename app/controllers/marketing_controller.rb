class MarketingController < ApplicationController

	def employees
		redirect_to listings_path if user_signed_in?

		@employee = Employee.new

    @coords = coords

    @near = near_formatted @coords
	end

  private

    def near_formatted coords
      n = Job.near(coords, 20).limit(100)
      nears = []
      n.each do |near|
        nears << {title: near.title, coords: [near.latitude, near.longitude],
          url: listing_path(near)}
      end
      return nears
    end

    def coords
      if Rails.env.production?
        loc = request.location
        Geocoder.coordinates("#{loc.city}, #{state}")
      else
        Geocoder.coordinates("Nixa, Missouri")
      end
    end

end
