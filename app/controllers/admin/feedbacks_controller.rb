class Admin::FeedbacksController < ApplicationController
  before_filter :admin_only!, only: :index

  def index
    @feedbacks = Feedback.all
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.user = current_user

    @feedback.save
    flash[:success] = "Message successfully sent!  We'll get back to you as soon as we can!"
    redirect_to root_path
  end

end
