class EmployerDashboardController < ApplicationController
  authorize_resource :employer, :job
  before_filter :employer_only!

  def show

  end
end
