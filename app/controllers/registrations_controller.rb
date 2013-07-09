class RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    super(:user, resource)
  end
end
