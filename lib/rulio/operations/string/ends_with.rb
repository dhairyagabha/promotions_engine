#
# Rulio::Operations::String::EndsWith
# This class allows you to check if your "variable value" ends with the "value".
# This class requires both - variable and value to be strings to run a ends with
# check successfully. This function will allow checking strings and numbers.
# If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether your URL path ends with product category
# you can check as following:
# operation = Rulio::Operations::String::EndsWith.new("telescopes", "/us/en/products/telescopes")
# if operation.execute
#   puts "This path is for Telescopes."
# end
#

module Rulio
  module Operations
    module String
      class EndsWith
        def initialize(value, variable)
          @value = value.to_s
          @variable = variable.to_s
        end

        def execute
          @variable.index(@value) + @value.length === @variable.length
        end
      end
    end
  end
end