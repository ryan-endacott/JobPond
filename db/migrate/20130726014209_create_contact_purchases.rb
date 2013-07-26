class CreateContactPurchases < ActiveRecord::Migration
  def change
    create_table :contact_purchases do |t|
      t.references :employer
      t.references :employee
      t.string :charge_id
      t.boolean :refunded

      t.timestamps
    end
    add_index :contact_purchases, :employer_id
    add_index :contact_purchases, :employee_id
  end
end
