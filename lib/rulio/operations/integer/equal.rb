#
# Rulio::Operations::Integer::Equal
# This class allows you to check if your "variable value" is equal to
# the "value". This class requires both - variable and value to be integers to run
# a less than equal to check successfully. This function will allow checking numbers
# only. If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether the number of items in cart is a particular
# amount you can check as following:
# cart.items_count = 10
# operation = Rulio::Operations::Integer::Equal.new(10.00, cart.items_count)
# if operation.execute
#   puts "This user is still eligible to show a product recommendation."
# end
#

module Rulio
    module Operations
        module Integer
            class Equal
                def initialize(value, variable)
                @value = value.to_f
                @variable = variable.to_f
                end

                def execute
                @variable === @value
                end
            end
        end
    end
end