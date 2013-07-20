# JobsController is for employers, ListingsController is for all.
class ListingsController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@listings = Job.search(params[:search], params[:zipcode]).paginate page: params[:page]
  end

  def show
  	@listing = Job.find(params[:id])
  end
end