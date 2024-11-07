module Rulio
  class Group
    def initialize(operations, by)
      validate_arguments(operations, by)
      @operations = operations
      @by = by
    end

    def execute
      return execute_and if @by === "AND"
      return execute_or if @by === "OR"
    end

    private

    def execute_and
      outcome = true
      @operations.each do |o|
        outcome = o.execute && outcome
      end
      outcome
    end

    def execute_or
      outcome = false
      @operations.each do |o|
        outcome = o.execute || outcome
      end
      outcome
    end

    def validate_arguments(operations, by)
      operations.each do |o|
        raise TypeError, "Group initialize need the first argument to be an array of Operation class objects. Found #{o.class}" unless [
          'Rulio::Operations::Integer::GreaterThan', 'Rulio::Operations::Integer::GreaterThanEqual', 'Rulio::Operations::Integer::Equal',
          'Rulio::Operations::Integer::LessThan', 'Rulio::Operations::Integer::LessThanEqual',
          'Rulio::Operations::String::Contains', 'Rulio::Operations::String::StartsWith', 'Rulio::Operations::String::EndsWith',
          'Rulio::Operations::Falsy', 'Rulio::Operations::Truthy'
        ].include?(o.class.to_s)
      end
      raise "Group initialize need the second argument to be 'AND' or 'OR'. Found #{by}" unless ["AND", "OR"].include?(by)
    end
  end
end