class JobSerializer < ActiveModel::Serializer
  attributes :id, :description, :title, :company
  has_many :applications
end
