class Feedback < ActiveRecord::Base
  belongs_to :user
  attr_accessible :message
  validates :message, presence: true
end
