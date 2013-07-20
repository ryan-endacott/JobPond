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
  attr_accessible :description, :pay, :title, :employer_id,
    :address, :city, :state, :latitude, :longitude

  before_save :cap_title

  geocoded_by :full_street_address
  after_validation :geocode, if: :location_changed?

  def self.search search
  	if search
  		where('title LIKE ?', "%#{search}%")
  	else
  		where('title LIKE ?', "%") #needs a relation
  	end
  end

  private

    def location_changed?
      address_changed? || city_changed? || state_changed?
    end

    def full_address
      "#{self.address}, #{self.state}, #{self.city}"
    end

  	def cap_title
  		self.title = self.title.capitalize
  	end
end
