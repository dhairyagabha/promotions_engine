#
# Rulio::Operations::Falsy
# This class allows you to check if your "variable value"
# is False/Falsy. This class only requires variable.
#
# For example:
# If you wanted to check whether a cookie value is true,
# you can check as following:
# operation = Rulio::Operations::Falsy.new("false")
# if operation.execute
#   puts "The value is true"
# end
#

module Rulio
  module Operations
    class Falsy
      def initialize(variable)
        @variable = variable
      end

      def execute
        ["false", "False", "FALSE", 0, "0", false, nil, "nil", "null", "undefined", ""].include?(@variable)
      end
    end
  end
end