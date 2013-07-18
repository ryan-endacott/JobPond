class AddCanContactToEmployees < ActiveRecord::Migration
  def change
    add_column :users, :can_contact, :boolean, default: false
  end
end
