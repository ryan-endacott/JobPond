# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  pay         :decimal(, )
#  employer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  address     :string(255)
#  city        :string(255)
#  state       :string(255)
#

require 'spec_helper'

describe Job do

	before do
		@job = FactoryGirl.create :job
	end

	it { @job.should respond_to :description }
	it { @job.should respond_to :pay }
  it { @job.should respond_to :title }
  it { @job.should respond_to :address }
  it { @job.should respond_to :city }
  it { @job.should respond_to :state }

  it { should belong_to :employer }
  it { should have_many :applieds }
  it { should have_many(:applicants).through :applieds }

end
