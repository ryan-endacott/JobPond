# == Schema Information
#
# Table name: applieds
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  job_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Applied < ActiveRecord::Base
	belongs_to :employee
	belongs_to :job
  attr_accessible :employee_id, :job_id
end
