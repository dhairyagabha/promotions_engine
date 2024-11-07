#
# Rulio::Operations::Integer::LessThanEqual
# This class allows you to check if your "variable value" is less than or equal to
# the "value". This class requires both - variable and value to be integers to run
# a less than equal to check successfully. This function will allow checking numbers
# only. If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether cart total is less than or equal to a particular
# amount you can check as following:
# cart.total = 95.50
# operation = Rulio::Operations::Integer::LessThanEqual.new(100.00, cart.total)
# if operation.execute
#   puts "This user is still eligible to show a product recommendation."
# end
#

module Rulio
  module Operations
    module Integer
      class LessThanEqual
        def initialize(value, variable)
          @value = value.to_f
          @variable = variable.to_f
        end

        def execute
          @variable <= @value
        end
      end
    end
  end
end