class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.string :level_of_education
      t.string :specialty
      t.string :resume

      t.timestamps
    end
  end
end
