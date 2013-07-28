class ContactPurchase < ActiveRecord::Base
  belongs_to :employer
  belongs_to :employee
  attr_accessible :charge_id, :refunded
  validates :charge_id, :refunded, presence: true
end
