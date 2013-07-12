# == Schema Information
#
# Table name: job_experiences
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  company    :string(255)
#  time       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  resume_id  :integer
#

require 'spec_helper'

describe JobExperience do
  pending "add some examples to (or delete) #{__FILE__}"
end
