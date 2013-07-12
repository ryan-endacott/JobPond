# == Schema Information
#
# Table name: resumes
#
#  id                :integer          not null, primary key
#  phone_number      :string(255)
#  address           :string(255)
#  job_experience    :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :integer
#  city              :string(255)
#  state             :string(255)
#  zipcode           :string(255)
#  description       :text
#  birthday          :date
#  highest_education :string(255)
#  highest_major     :string(255)
#  current_education :string(255)
#  current_major     :string(255)
#  graduation_date   :date
#

class Resume < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zipcode,
   	:phone_number, :job_experiences_attributes, :description,
   	:highest_education, :highest_major,
   	:current_education, :current_major,
   	:graduation_date, :birthday

  belongs_to :employee
  has_many :job_experiences
  accepts_nested_attributes_for :job_experiences, :reject_if => :all_blank, :allow_destroy => true
end
