class RemoveJobsFromApply < ActiveRecord::Migration
  def change
    remove_column :applies, :jobs_id, :integer
  end
end
