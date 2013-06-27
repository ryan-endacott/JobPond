require 'spec_helper'

describe Employer do

	before do
		@employer = FactoryGirl.create :employer
	end
  
	it { @employer.should respond_to :jobs }

end
