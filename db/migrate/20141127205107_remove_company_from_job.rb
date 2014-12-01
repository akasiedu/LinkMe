class RemoveCompanyFromJob < ActiveRecord::Migration
  def self.up
  	  	remove_column :jobs, :companies_id
  end

  def self.down
  	add_column :jobs, :companies_id
  end


end
