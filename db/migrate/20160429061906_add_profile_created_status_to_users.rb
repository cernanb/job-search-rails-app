class AddProfileCreatedStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_created, :boolean, default: false
  end
end
