#
# Rulio::Operations::String::StartsWith
# This class allows you to check if your "variable value" starts with the "value".
# This class requires both - variable and value to be strings to run a starts with
# check successfully. This function will allow checking strings and numbers.
# If used with dates, this will not account for the date range. Please use the
# Operations::DateIs, Operations::DateBefore, or Operations::DateAfter.
#
# For example:
# If you wanted to check whether your URL path starts with country code
# you can check as following:
# operation = Rulio::Operations::String::StartsWith.new("/us/en", "/us/en/products/telescopes")
# if operation.execute
#   puts "This path is for United States with English language."
# end
#

module Rulio
  module Operations
    module String
      class StartsWith
        def initialize(value, variable)
          @value = value.to_s
          @variable = variable.to_s
        end

        def execute
          @variable.index(@value) === 0
        end
      end
    end
  end
end