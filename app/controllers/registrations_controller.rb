class RegistrationsController < Devise::RegistrationsController
  def new
    super
    # Add logic here to detect Role and display different forms
  end

  def create
    super
  end

  def update
    super
  end
end