class Employers::PotentialHiresController < ApplicationController
  def index
    @job_seekers = Employee.all
  end
end
