class AddCompanyRefToApply < ActiveRecord::Migration
  def change
    add_reference :applies, :company, index: true
  end
end
