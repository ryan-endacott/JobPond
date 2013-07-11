class AddCityStateZipcodeToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :city, :string
    add_column :resumes, :state, :string
    add_column :resumes, :zipcode, :string
  end
end
