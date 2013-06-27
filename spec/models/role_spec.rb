require 'spec_helper'

describe Role do

	before do
		@roles = [:employee, :employer]
	end

	it "should have appropriate roles" do 
		@roles.each do |role|
			r = Role.find_by_name(role)
			r.should_not be_nil
		end
	end

end