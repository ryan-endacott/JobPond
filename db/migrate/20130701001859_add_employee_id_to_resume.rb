class AddEmployeeIdToResume < ActiveRecord::Migration
  def change
    change_table :resumes do |t|
      t.references :employee
    end
  end
end
