class CreateJobExperiences < ActiveRecord::Migration
  def change
    create_table :job_experiences do |t|
      t.string :title
      t.string :company
      t.string :time

      t.timestamps
    end
  end
end
