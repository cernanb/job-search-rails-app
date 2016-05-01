class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  has_many :references

  validates_presence_of :cover_letter

  def references_attributes=(ref_hash)
    ref_hash.values.each do |attr|
      self.references.build(attr)
    end
  end
end
