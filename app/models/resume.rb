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
  attr_accessible :address, :city, :state, :zipcode,
   	:phone_number,
   	:job_experience

  belongs_to :employee
  has_many :job_experiences
end
