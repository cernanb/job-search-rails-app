class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :status
      t.timestamps null: false
    end
  end
end
