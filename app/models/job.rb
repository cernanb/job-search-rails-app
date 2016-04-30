class Job < ActiveRecord::Base
  has_many :applications
  has_many :users, through: :applications

  validates_presence_of :title, :company, :description

end
