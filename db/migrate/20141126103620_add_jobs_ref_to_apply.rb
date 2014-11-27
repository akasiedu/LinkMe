class AddJobsRefToApply < ActiveRecord::Migration
  def change
    add_reference :applies, :jobs, index: true
  end
end
