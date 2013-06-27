require 'spec_helper'

describe Applied do
  
	before do
		@applied = FactoryGirl.create :applied
	end

  it { @applied.should respond_to :job }
  it { @applied.should respond_to :employee }

end
