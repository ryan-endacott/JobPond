class AddIndexToJobExperiencesResumeId < ActiveRecord::Migration
  def change
    add_index :job_experiences, :resume_id
  end
end
