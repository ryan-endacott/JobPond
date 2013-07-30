class AddDefaultPayToJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :pay, :decimal, default: 7.25
  end
end
