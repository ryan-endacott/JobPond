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

class Job < ActiveRecord::Base
	belongs_to :employer
	has_many :applieds
  has_many :applicants, :through => :applieds, :source => :employee

  attr_accessible :description, :pay, :title, :employer_id,
    :address, :city, :state, :latitude, :longitude

  before_save :cap_title

  validates :address, :city, :state, :pay, :description, :title, presence: true
  validates :title, length: { in: 1..50,
  	too_short: "Title must be longer",
  	too_long: "Title can only be %{count} characters long" }
  validates :description, length: { maximum: 500,
  	too_long: "Description can only be %{count} characters long"}
  validates_numericality_of :pay, greater_than_or_equal_to: 0

  geocoded_by :full_address
  after_validation :geocode, if: :location_changed?

  def self.search search, zipcode, dist
  	if search.nil?
  		search = ""
  	end
    if !zipcode.nil? && is_number?(zipcode) && !dist.nil? && is_number?(dist)
      near(zipcode).where('title LIKE ?', "%#{search}%").order("created_at DESC") #needs a relation
    else
      where('title LIKE ?', "%#{search}%").order("created_at DESC") #needs a relation
    end
  end

  def full_address
    "#{self.address}, #{self.city}, #{self.state}"
  end

  def self.is_number? object #has to be static method which sucks
    #obviously doen't belong here but where else to put?
    #Also may be a better way but this works for integers and thats all I need.
    object.to_i.to_s == object
  end

  private

    def location_changed?
      address_changed? || city_changed? || state_changed?
    end

  	def cap_title
  		self.title = self.title.capitalize
  	end
end

