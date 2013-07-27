class Employers::PotentialHiresController < ApplicationController
  before_filter :employer_only!

  def index
    @job_seekers = Employee.where(can_contact: true, reviewed: true).order("score DESC")
  end
end
