class ResumesController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def edit
    @resume = current_user.resume || current_user.build_resume
  end

  def update
  end

  def create
    @resume.save
    redirect_to employee_path
  end

end
