class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :business
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
