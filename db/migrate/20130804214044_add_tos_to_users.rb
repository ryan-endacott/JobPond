class AddTosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accepted_tos, :boolean
  end
end
