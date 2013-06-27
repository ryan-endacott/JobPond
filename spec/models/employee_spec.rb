require 'spec_helper'

describe Employee do

	before do
		@employee = FactoryGirl.create :employee
	end

	it { @employee.should respond_to :applieds }
	it { @employee.should respond_to :resume }

end
