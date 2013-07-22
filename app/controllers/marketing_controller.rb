class MarketingController < ApplicationController

	def employees
		redirect_to listings_path if user_signed_in?

		@employee = Employee.new
	end

end
