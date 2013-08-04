class Employers::PotentialHiresController < ApplicationController
  before_filter :employer_only!

  def index
    if !params[:search].blank? && params[:search] == "purchased"
      @job_seekers = current_user.purchased_contacts
    else
      @job_seekers = Employee.where(can_contact: true, reviewed: true).order("score DESC")
    end
  end
end
