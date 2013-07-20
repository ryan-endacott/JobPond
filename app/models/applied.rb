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
  MAX_PER_DAY = 5

	belongs_to :employee
	belongs_to :job
  attr_accessible :employee_id, :job_id

  validate :apply_limit

  private

    def apply_limit
      count = 0
      self.employee.applieds.each do |applied|
        count += 1 if applied.created_at.to_date == Date.current
        if count >= MAX_PER_DAY
          errors.add(:employee, 'You have applied too much today.')
          return
        end
      end
    end

end
