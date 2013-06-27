class Job < ActiveRecord::Base
	belongs_to :employer
	has_many :applieds
  attr_accessible :description, :pay, :title, :employer_id
end
