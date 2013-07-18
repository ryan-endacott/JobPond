# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController

  def index
  	@listings = Job.order("created_at DESC").limit(30)
  end

  def show
  end
end
