# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  type                   :string(255)
#  reviewed               :boolean
#  score                  :integer
#  company_name           :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email,
   :password, :password_confirmation, :remember_me, :type

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  alias_method :name, :full_name

  def employee?
  	return self.class == Employee
  end

  def employer?
		return self.class == Employer
  end

  def admin?
  	return self.class == Admin
  end

  def gravitar_url
    hash = Digest::MD5.hexdigest(self.email.strip)
    "http://www.gravatar.com/avatar/#{hash}?s=200&d=mm"
  end

end
