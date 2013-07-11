class JobExperience < ActiveRecord::Base
  attr_accessible :company, :time, :title
  validates :company, :time, :title, presence: true
  belongs_to :resume
end
