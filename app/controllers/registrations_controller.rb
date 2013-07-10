class RegistrationsController < Devise::RegistrationsController
  def build_resource(hash=nil)
    hash ||= resource_params || {}
    if hash[:type] == 'Employee'
      self.resource = Employee.new_with_session(hash, session)
    elsif hash[:type] == 'Employer'
      self.resource = Employer.new_with_session(hash, session)
    else
      self.resource = resource_class.new_with_session(hash, session)
    end
  end
end
