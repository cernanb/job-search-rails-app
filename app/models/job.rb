class Job < ActiveRecord::Base
  has_many :applications
  has_many :users, through: :applications
  has_many :comments

  validates_presence_of :title, :company, :description

  def self.order_by_num_of_apps
    self.all.sort {|a, b| b.apps_count <=> a.apps_count }
  end

  def apps_count
    applications.count
  end
end
