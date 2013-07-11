class AddResumeIdToJobExperiences < ActiveRecord::Migration
  def change
  	change_table :job_experiences do |t|
      t.references :resume
    end
  end
end
