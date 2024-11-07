module Rulio
  class Condition
    def initialize(groups, by)
      validate_arguments(groups, by)
      @groups = groups
      @by = by
    end

    def execute
      return execute_and if @by === "AND"
      return execute_or if @by === "OR"
    end

    private

    def execute_and
      outcome = true
      @groups.each do |g|
        outcome = g.execute && outcome
      end
      outcome
    end

    def execute_or
      outcome = false
      @groups.each do |g|
        outcome = g.execute || outcome
      end
      outcome
    end

    def validate_arguments(groups, by)
      groups.each do |g|
        raise TypeError, "Condition initialize need the first argument to be an array of Group class objects. Found #{g.class}" unless g.class.to_s === 'Rulio::Group'
      end
      raise "Condition initialize need the second argument to be 'AND' or 'OR'. Found #{by}" unless ["AND", "OR"].include?(by)
    end
  end
end