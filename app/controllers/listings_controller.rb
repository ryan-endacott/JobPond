# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController

  def index
  	@listings = Job.paginate page: params[:page]
  end

  def show
  	@listing = Job.find(params[:id])
  	#raise @listing.employer.jobs.to_yaml
  end
end
