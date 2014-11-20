class AddCompanyToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :companies, index: true
  end
end
