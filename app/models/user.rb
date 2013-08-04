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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email,
   :password, :password_confirmation, :remember_me, :type,
   :avatar, :accepted_tos

  ## If i don't have the first the form says not method...
  ## If i don't have the second can't mass assign...
  ## Idk why the second one alone won't just work...
  #attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :proc
  #attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  validates :first_name, :last_name, presence: true
  validates :accepted_tos, acceptance: {accept: true}, presence: true

  #has_attached_file :avatar, styles: {
  #  large: { geometry: "700x700>" },
  #  medium: { geometry: "200x200#", processors: [:cropper]}
  #}
  #after_update :reprocess_avatar, :if => :cropping?

  has_attached_file :avatar, styles: { large: "700x700>", medium: "200x200#" }



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

  def avatar_url
    if !avatar.exists?
      hash = Digest::MD5.hexdigest(self.email.strip)
      "http://www.gravatar.com/avatar/#{hash}?s=200&d=mm"
    else
      avatar.url
    end
  end

  def cropping?
    !proc && !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end

  private

    def reprocess_avatar
      avatar.reprocess!
    end

end
