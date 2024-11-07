#
# Rulio::Operations::String::StartsWith
# This class allows you to check if your "variable value" contains the "value".
# This class requires both - variable and value to be strings to run a contains
# check successfully. This function will allow checking strings and numbers.
# If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether your URL path contains "/products"
# you can check as following:
# operation = Rulio::Operations::String::Contains.new("/products", "/us/en/products/telescopes")
# if operation.execute
#   puts "This path is for one of the product pages."
# end
#

module Rulio
  module Operations
    module String
      class Contains
        def initialize(value, variable)
          @value = value.to_s
          @variable = variable.to_s
        end

        def execute
          !@variable.index(@value).nil?
        end
      end
    end
  end
end