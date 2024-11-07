#
# Rulio::Operations::Integer::GreaterThan
# This class allows you to check if your "variable value" is greater than the "value".
# This class requires both - variable and value to be integers to run a greater than
# check successfully. This function will allow checking numbers only.
# If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether products in cart is greater than a particular number
# you can check as following:
# cart.products.count = 5
# operation = Rulio::Operations::Integer::GreaterThan.new(2, cart.products.count)
# if operation.execute
#   puts "There are more than 2 products in cart."
# end
#

module Rulio
  module Operations
    module Integer
      class GreaterThan
        def initialize(value, variable)
          @value = value.to_f
          @variable = variable.to_f
        end

        def execute
          @variable > @value
        end
      end
    end
  end
end