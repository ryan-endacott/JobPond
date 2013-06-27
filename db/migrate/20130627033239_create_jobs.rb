class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.decimal :pay
      t.integer :employer_id

      t.timestamps
    end
  end
end
