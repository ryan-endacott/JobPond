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