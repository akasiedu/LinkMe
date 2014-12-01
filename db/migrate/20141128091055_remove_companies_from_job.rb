class RemoveCompaniesFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :companies_id, :integer
  end
end
