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

  geocoded_by :full_address
  after_validation :geocode, if: :location_changed?

  def self.search search, zipcode, dist
  	if search.nil?
  		search = ""
  	end
    if !zipcode.nil? && is_number?(zipcode) && !dist.nil? && is_number?(dist)
      near(zipcode, dist).where('title LIKE ?', "%#{search}%") #needs a relation
    else
      where('title LIKE ?', "%#{search}%") #needs a relation
    end
  end

  private

    def self.is_number? object #has to be static method which sucks
      #obviously doen't belong here but where else to put?
      #Also may be a better way but this works for integers and thats all I need.
      object.to_i.to_s == object
    end

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
