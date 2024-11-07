class Condition < ApplicationRecord

  BY = ["AND", "OR"]

  belongs_to :promotion
  has_many :groups, dependent: :destroy
  accepts_nested_attributes_for :groups, reject_if: :all_blank, allow_destroy: true

  def to_rulio(params)
    return Rulio::Condition.new(self.groups.map{|g| g.to_rulio(params)}, self.by)
  end
end
