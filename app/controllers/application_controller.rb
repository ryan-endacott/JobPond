class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
    def employer_only!
      authenticate_user!
      unless current_user.employer?
        flash[:error] = "You must be an employer to access this page."
        redirect_to root_path
      end
    end
end
