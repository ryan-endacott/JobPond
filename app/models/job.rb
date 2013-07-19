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

  before_save :cap_title

  def self.search search
  	if search
  		where('title LIKE ?', "%#{search}%")
  	else
  		where('title LIKE ?', "%") #needs a relation
  	end
  end

  private
  	def cap_title
  		self.title = self.title.capitalize
  	end
end
