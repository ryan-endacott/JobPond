# == Schema Information
#
# Table name: resumes
#
#  id                :integer          not null, primary key
#  phone_number      :string(255)
#  address           :string(255)
#  job_experience    :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :integer
#  city              :string(255)
#  state             :string(255)
#  zipcode           :string(255)
#  description       :text
#  birthday          :date
#  highest_education :string(255)
#  highest_major     :string(255)
#  current_education :string(255)
#  current_major     :string(255)
#  graduation_date   :date
#

class Resume < ActiveRecord::Base
  attr_accessible :address, :city, :state, :zipcode,
   	:phone_number, :job_experiences_attributes, :description,
   	:highest_education, :highest_major,
   	:current_education, :current_major,
   	:graduation_date, :birthday, :references_attributes

  belongs_to :employee
  has_many :job_experiences
  has_many :references
  accepts_nested_attributes_for :job_experiences, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :references, :reject_if => :all_blank, :allow_destroy => true

  validates :phone_number, format: { with: /\A\d{3}-?\d{3}-?\d{4}\z/ }, allow_blank: true

  before_save :needs_review?

  def full_address
    if !address.blank? && !city.blank? && !state.blank? && !zipcode.blank?
      "#{address}, #{city}, #{state}, #{zipcode}"
    else
      "No address entered."
    end
  end

  def incomplete?
    address.blank? || city.blank? || state.blank? || zipcode.blank? ||
     phone_number.blank? || description.blank? || birthday.blank?
  end

  private

    def needs_review?
      if self.changed? && self.employee
        e = self.employee
        e.reviewed = nil;
        e.save
      end
    end

end
