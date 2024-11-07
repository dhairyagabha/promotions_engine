#
# Rulio::Operations::RegEx
# This class allows you to check if your "variable value"
# matches "value" pattern set. This class requires first
# parameter to be a valid regex pattern and second parameter
# to be a string.
#
# For example:
# If you wanted to check whether a String matches a pattern,
# you can check as following:
# operation = Rulio::Operations::Regex.new(/(hello|world)/, "Hellow world")
# if operation.execute
#   puts "The value is a match"
# end
#

module Rulio
  module Operations
    class Regex
      def initialize(value, variable)
        validate_arguments(value)
        @pattern = value
        @variable = variable
      end

      def execute
        @pattern.match?(@variable)
      end

      private

      def validate_arguments(value)
        raise TypeError, "Regex initialize need the first argument to be a valid RegEx operation. Found #{value.class}" if value.class != Regexp
      end
    end
  end
end