class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

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
