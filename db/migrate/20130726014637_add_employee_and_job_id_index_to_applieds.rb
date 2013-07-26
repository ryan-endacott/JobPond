class AddEmployeeAndJobIdIndexToApplieds < ActiveRecord::Migration
  def change
    add_index :applieds, :job_id
    add_index :applieds, :employee_id
  end
end
