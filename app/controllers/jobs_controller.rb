# JobsController is for employers, ListingsController is for all.
class JobsController < ApplicationController
  authorize_resource :employer, :job
  before_filter :employer_only!

  def
end
