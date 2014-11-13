class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :company_logo
      t.text :job_description

      t.timestamps
    end
  end
end
