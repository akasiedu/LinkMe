class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :type_of_business
      t.string :email

      t.timestamps
    end
  end
end
