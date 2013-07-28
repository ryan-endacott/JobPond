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
#

class Employee < User
	attr_protected :reviewed, :score
	has_one :resume
	has_many :applieds
  has_many :applied_jobs, :through => :applieds, :source => :job

  attr_accessible :can_contact

  after_create :create_resume
  before_create :can_contact_default

  validates :can_contact, presense: true

  validate :needs_score_on_review

  def can_contact?
    can_contact
  end

  def applied_for? job
    job.applicants.each do |applicant|
      return true if applicant == self
    end
    false
  end

  private
    def can_contact_default
      self.can_contact = true
    end

  	def create_resume
      self.build_resume.save if self.resume.nil?
  	end

  	def needs_score_on_review
  		if self.reviewed
  			errors.add(:score, 'Not a valid score!') unless
          self.score && self.score >= 0 && self.score <= 100
  		end
		end
end
