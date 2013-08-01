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

require 'spec_helper'

describe ContactPurchase do
  pending "add some examples to (or delete) #{__FILE__}"
end
