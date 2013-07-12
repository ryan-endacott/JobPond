class AddReviewedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reviewed, :boolean
  end
end
