class RemoveJobRefFromApply < ActiveRecord::Migration
  def self.up
  	  	remove_column :applies, :jobs_id
  end
  def self.down
  	add_column :applies, :jobs_id
  end
end
