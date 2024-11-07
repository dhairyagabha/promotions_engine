#
# Rulio::Operations::Truthy
# This class allows you to check if your "variable value" is True/Truthy.
# This class only requires variable.
#
# For example:
# If you wanted to check whether a cookie value is true, you can check as
# following:
# operation = Rulio::Operations::Truthy.new("true")
# if operation.execute
#   puts "The value is true"
# end
#

module Rulio
  module Operations
    class Truthy
      def initialize(variable)
        @variable = variable
      end

      def execute
        ["true", "True", "TRUE", 1, "1", true].include?(@variable)
      end
    end
  end
end