class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :json

  before_filter :notice

  def notice
    flash[:notice] = "Some Awesome text;"
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

    def after_sign_in_path_for(user)
      if user.employer?
        path = employers_dashboard_path
      else
        if user.resume.incomplete?
          flash[:notice] += " Your resume is incomplete.  You should finish filling it out."
          path = edit_employees_resume_path
        else
          path = listings_path
        end
      end
      session[:user_return_to] || path #Was on page or go to new
    end

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
