class Employers::DashboardController < ApplicationController
  authorize_resource :employer, :job
  before_filter :employer_only!

  def show
    @listings = current_user.jobs
  end
end
