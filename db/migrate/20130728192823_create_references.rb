class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :relationship
      t.string :length_known
      t.string :phone_number
      t.string :email
      t.integer :resume_id

      t.timestamps
    end
  end
end
