class Reference < ActiveRecord::Base
  attr_accessible :email, :length_known, :name, :phone_number, :relationship
  belongs_to :resume
end
