# == Schema Information
#
# Table name: applieds
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  job_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Applied do
  
	before do
		@applied = FactoryGirl.create :applied
	end

  it { @applied.should respond_to :job }
  it { @applied.should respond_to :employee }

end
