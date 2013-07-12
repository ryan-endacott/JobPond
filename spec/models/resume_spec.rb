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

require 'spec_helper'

describe Resume do

	before do
		@job = FactoryGirl.create :resume
	end
  
	it { @job.should respond_to :phone_number }
	it { @job.should respond_to :address }
	it { @job.should respond_to :job_experience }
	it { @job.should respond_to :employee }

end
