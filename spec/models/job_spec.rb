# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  pay         :decimal(, )
#  employer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Job do

	before do
		@job = FactoryGirl.create :job
	end
  
	it { @job.should respond_to :description }
	it { @job.should respond_to :pay }
	it { @job.should respond_to :title }
	it { @job.should respond_to :employer }
	it { @job.should respond_to :applieds }

end
