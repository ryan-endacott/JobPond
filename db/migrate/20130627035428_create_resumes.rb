class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :phone_number
      t.string :address
      t.string :job_experience

      t.timestamps
    end
  end
end
