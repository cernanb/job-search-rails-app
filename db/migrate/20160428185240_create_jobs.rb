class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.text :description
      t.boolean :filled
      t.timestamps null: false
    end
  end
end