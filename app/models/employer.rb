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
#  first_name             :string(255)
#  last_name              :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  type                   :string(255)
#  reviewed               :boolean
#  score                  :integer
#  company_name           :string(255)
#  can_contact            :boolean          default(FALSE)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class Employer < User
	attr_accessible :company_name
	validates :company_name, presence: true
	has_many :jobs
  has_many :contact_purchases
  has_many :purchased_contacts, through: :contact_purchases, source: :employee


  def my_listing? listing
    listing.employer == self
  end

  def all_applicants
    jobs.map(&:applicants).flatten
  end

  def can_see_contact? employee
    all_applicants.include?(employee) || purchased_contacts.include?(employee)
  end

end
