class AddBirthdayAndSchooolToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :birthday, :date
    add_column :resumes, :highest_education, :string
    add_column :resumes, :highest_major, :string
    add_column :resumes, :current_education, :string
    add_column :resumes, :current_major, :string
    add_column :resumes, :graduation_date, :date
  end
end
