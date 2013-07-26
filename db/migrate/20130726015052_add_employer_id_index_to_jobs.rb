class AddEmployerIdIndexToJobs < ActiveRecord::Migration
  def change
    add_index :jobs, :employer_id
  end
end
