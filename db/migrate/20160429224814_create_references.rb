class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :phone_number
      t.string :relationship
      
      t.timestamps null: false
    end
  end
end
