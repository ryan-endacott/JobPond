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
		@roles = [:employee?, :employer?, :admin?]
		@user = FactoryGirl.create :user
	end

	it "should respond appropriate roles" do 
		@roles.each do |role|
			user = User.all.first
			user.should respond_to role
		end
	end

end
