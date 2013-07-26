class ContactPurchases < ActiveRecord::Base
  belongs_to :employer
  belongs_to :employee
  attr_accessible :charge_id, :refunded
end
