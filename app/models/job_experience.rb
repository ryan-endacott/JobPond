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

  validates :title, length: { in: 1..50,
  	too_short: "Title must be longer",
  	too_long: "Title can only be %{count} characters long" }
  validates :description, length: { maximum: 500,
  	too_long: "Description can only be %{count} characters long"}
  validates_numericality_of :time, greater_than_or_equal_to: 0
end
