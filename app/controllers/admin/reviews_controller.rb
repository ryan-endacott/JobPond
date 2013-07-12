class Admin::ReviewsController < ApplicationController
  before_filter :admin_only!
  # GET /admin/reviews
  # GET /admin/reviews.json
  def index
    @reviews = Employee.where("reviewed = true")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /admin/reviews/1
  # GET /admin/reviews/1.json
  def show
    @admin_review = Admin::Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_review }
    end
  end

  # GET /admin/reviews/1/edit
  def edit
    @admin_review = Admin::Review.find(params[:id])
  end

  # PUT /admin/reviews/1
  # PUT /admin/reviews/1.json
  def update
    @admin_review = Admin::Review.find(params[:id])

    respond_to do |format|
      if @admin_review.update_attributes(params[:admin_review])
        format.html { redirect_to @admin_review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_review.errors, status: :unprocessable_entity }
      end
    end
  end

end
