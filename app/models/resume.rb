class Resume < ActiveRecord::Base
  attr_accessible :address, :job_experience, :phone_number
  belongs_to :employee
end
