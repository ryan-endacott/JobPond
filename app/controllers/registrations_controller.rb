class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  def sign_up(resource_name, resource)
    super(:user, resource)
  end
end
