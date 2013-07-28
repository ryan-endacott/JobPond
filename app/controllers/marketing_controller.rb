class MarketingController < ApplicationController

	def employees

    if user_signed_in?
      flash.keep
  		redirect_to listings_path
    end

		@employee = Employee.new

    @coords = coords || [37.0433863, -93.294353] # Backup to nixa coords

    @near = near_formatted @coords
	end

  def employers
    @employer = Employer.new
  end

  private

    def near_formatted coords
      n = Job.includes(:employer).near(coords, 20)
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
