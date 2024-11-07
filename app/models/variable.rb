class Variable < ApplicationRecord

  enum :value_type, [:string, :list, :decimal, :boolean]

  validates_presence_of :name, :description, :key, :value_type

  belongs_to :property
end
