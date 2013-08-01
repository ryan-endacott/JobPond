# == Schema Information
#
# Table name: contact_purchases
#
#  id          :integer          not null, primary key
#  employer_id :integer
#  employee_id :integer
#  charge_id   :string(255)
#  refunded    :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ContactPurchase < ActiveRecord::Base
  belongs_to :employer
  belongs_to :employee
  attr_accessible :charge_id, :refunded
  validates :charge_id, presence: true
end
