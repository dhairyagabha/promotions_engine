class Group < ApplicationRecord

  BY = ["AND", "OR"]

  belongs_to :condition
  has_many :operations, dependent: :destroy
  accepts_nested_attributes_for :operations, reject_if: :all_blank, allow_destroy: true

  def to_rulio(params)
    return Rulio::Group.new(self.operations.map{|o| o.to_rulio(params)}, self.by)
  end
end
