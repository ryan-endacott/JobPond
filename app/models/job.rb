# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  pay         :decimal(, )
#  employer_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Job < ActiveRecord::Base
	belongs_to :employer
	has_many :applieds
  has_many :applicants, :through => :applieds, :source => :employee
  attr_accessible :description, :pay, :title, :employer_id

validates :title, length: { in: 1..50,
  	too_short: "Title must be longer"
  	too_long: "Title can only be %{count} characters long" }
  validates :description, length: { maximum: 500,
  	too_long: "Description can only be %{count} characters long"}
  validates :pay, numericality: true, greater_than_or_equal_to: 0
end

