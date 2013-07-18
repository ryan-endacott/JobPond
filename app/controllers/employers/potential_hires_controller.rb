class Employers::PotentialHiresController < ApplicationController
  before_filter :employer_only!

  def index
    @job_seekers = current_user.jobs.map(&:applicants) | Employee.where(can_contact: true)
  end
end
