class AddJobsRefToApply < ActiveRecord::Migration
  def change
    add_column :applies, :jobs, :reference
  end
end
