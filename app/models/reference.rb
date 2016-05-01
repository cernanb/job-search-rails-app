class Reference < ActiveRecord::Base
  belongs_to :application

  validates_presence_of :name, :phone_number, :relationship
end
