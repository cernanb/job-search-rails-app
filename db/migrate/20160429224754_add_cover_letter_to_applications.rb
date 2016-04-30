class AddCoverLetterToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :cover_letter, :text
  end
end
