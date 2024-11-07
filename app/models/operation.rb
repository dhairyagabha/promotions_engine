class Operation < ApplicationRecord

  OPERATORS = [
    ["Truthy", "Rulio::Operations::Truthy"],
    ["Falsy", "Rulio::Operations::Falsy"],
    ["Regex", "Rulio::Operations::Regex"],
    ["Contains", "Rulio::Operations::String::Contains"],
    ["StartsWith", "Rulio::Operations::String::StartsWith"],
    ["EndsWith", "Rulio::Operations::String::EndsWith"],
    ["Equal", "Rulio::Operations::Integer::Equal"],
    ["LessThan", "Rulio::Operations::Integer::LessThan"],
    ["GreaterThan", "Rulio::Operations::Integer::GreaterThan"],
    ["LessThanEqual", "Rulio::Operations::Integer::LessThanEqual"],
    ["GreaterThanEqual", "Rulio::Operations::Integer::GreaterThanEqual"]
  ]

  belongs_to :group

  def to_rulio(params)
    return self.operator.constantize.new(self.constant, params[self.variable_key.to_sym])
  end

end
