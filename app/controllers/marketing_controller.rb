class MarketingController < ApplicationController

	def employees
		@jobs = Job.limit(30).order("created_at DESC")
	end
end
