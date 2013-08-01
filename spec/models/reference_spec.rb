# == Schema Information
#
# Table name: references
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  relationship :string(255)
#  length_known :string(255)
#  phone_number :string(255)
#  email        :string(255)
#  resume_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Reference do
  pending "add some examples to (or delete) #{__FILE__}"
end
