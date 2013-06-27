class Job < ActiveRecord::Base
	belongs_to :employer
  attr_accessible :description, :pay, :title, :employer_id
end
