class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  def create
    params[:password_confirmation] = params[:password]
    super
  end

  def after_sign_up_path_for(user)
    if user.employer?
      analytics_event('Employer', 'Sign Up', user.company_name)
      new_employers_job_path
    else # Job Seeker
      analytics_event('Job Seeker', 'Sign Up', user.name)
      flash[:notice] = "Welcome #{user.first_name}! The next step is to fill out your resume."
      edit_employees_resume_path
    end
  end

  def sign_up(resource_name, resource)
    super(:user, resource)
  end

	def current_employer
  	current_user
  end
  def current_employee
  	current_user
  end
  def resource
    current_user || super
  end

end
