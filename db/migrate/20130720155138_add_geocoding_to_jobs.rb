class AddGeocodingToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :latitude, :float
    add_column :jobs, :longitude, :float
    add_column :jobs, :address, :string
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
  end
end
