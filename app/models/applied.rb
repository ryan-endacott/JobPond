class Applied < ActiveRecord::Base
	belongs_to :employee
	belongs_to :job
  attr_accessible :employee_id, :job_id
end
