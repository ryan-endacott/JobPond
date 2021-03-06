class Admin::ReviewsController < ApplicationController
  before_filter :admin_only!
  # GET /admin/reviews
  # GET /admin/reviews.json
  def index
    @reviews = Employee.where(reviewed: nil)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /admin/reviews/1/edit
  def edit
    @review = Employee.find(params[:id])
  end

  # PUT /admin/reviews/1
  # PUT /admin/reviews/1.json
  def update
    @review = Employee.find(params[:id])

    respond_to do |format|
      @review.reviewed = true; @review.score = params[:employee][:score];
      if @review.save
        format.html { redirect_to admin_reviews_path, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

end
