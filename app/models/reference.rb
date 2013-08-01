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

class Reference < ActiveRecord::Base
  attr_accessible :email, :length_known, :name, :phone_number, :relationship
  belongs_to :resume
end
