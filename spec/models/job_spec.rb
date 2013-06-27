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
