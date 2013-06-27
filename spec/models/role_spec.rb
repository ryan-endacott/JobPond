# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe User do

	before do
		@roles = [:employee, :employer, :admin]
		@user = FactoryGirl.create :user
	end

	it "should respond appropriate roles" do 
		@roles.each do |role|
			method = "#{role}?".to_sym
			user = User.all.first
			user.should respond_to method
		end
	end

	it "should be an employee" do
		u = FactoryGirl.create :employee
		u.employee?.should == true
	end

	it "should be an employer" do
		u = FactoryGirl.create :employer
		u.employer?.should == true
	end
	
	it "should be an admin" do
		u = FactoryGirl.create :admin
		u.admin?.should == true
	end
	


end
