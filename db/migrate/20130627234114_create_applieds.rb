class CreateApplieds < ActiveRecord::Migration
  def change
    create_table :applieds do |t|
      t.integer :employee_id
      t.integer :job_id

      t.timestamps
    end
  end
end
