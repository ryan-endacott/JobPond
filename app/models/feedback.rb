# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  message    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ActiveRecord::Base
  belongs_to :user
  attr_accessible :message
  validates :message, presence: true
end
