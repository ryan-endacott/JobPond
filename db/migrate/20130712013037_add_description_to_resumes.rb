class AddDescriptionToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :description, :text
  end
end
