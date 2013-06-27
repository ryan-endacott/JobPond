# == Schema Information
#
# Table name: resumes
#
#  id             :integer          not null, primary key
#  phone_number   :string(255)
#  address        :string(255)
#  job_experience :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Resume < ActiveRecord::Base
  attr_accessible :address, :job_experience, :phone_number
  belongs_to :employee
end
