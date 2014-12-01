class RemoveCompaniesRefFromApply < ActiveRecord::Migration
 def self.up
  	remove_column :applies, :company_id
 end

 def self.down
  	add_column :applies, :company_id
 end
end
