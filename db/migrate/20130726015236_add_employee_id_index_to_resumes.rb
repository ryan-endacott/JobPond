class AddEmployeeIdIndexToResumes < ActiveRecord::Migration
  def change
    add_index :resumes, :employee_id
  end
end
