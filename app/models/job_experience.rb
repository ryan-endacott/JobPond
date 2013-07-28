# == Schema Information
#
# Table name: job_experiences
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  company    :string(255)
#  time       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume_id  :integer
#

class JobExperience < ActiveRecord::Base
  attr_accessible :company, :time, :title
  validates :company, :time, :title, presence: true
  belongs_to :resume

end
