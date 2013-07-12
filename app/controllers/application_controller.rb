class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :json

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

    def employee_only!
      authenticate_user!
      unless current_user.employee?
        flash[:error] = "You must be an employee to access this page."
        redirect_to root_path
      end
    end

    def admin_only!
      authenticate_user!
      unless current_user.admin?
        flash[:error] = "You must be an admin to access this page."
        redirect_to root_path
      end
    end
end
