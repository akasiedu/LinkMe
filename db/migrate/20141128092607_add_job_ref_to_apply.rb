class AddJobRefToApply < ActiveRecord::Migration
  def change
    add_reference :applies, :job, index: true
  end
end
