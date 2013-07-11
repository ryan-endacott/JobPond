# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController

  def index
  	@listings = Job.all
  end

  def show
  end
end
