module Rulio
  class Rule
    def initialize(*conditions)
      @conditions = conditions
    end

    def execute
      @conditions.each do |c|
        response = c.execute
        return response if response != false
      end
    end
  end
end
