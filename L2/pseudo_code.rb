# A method that takes an array of strings, and returns a string that is all those strings concatenated together

## Casual

# Given an array of strings
#
# Set empty string variable
# Iterate through the array
# - Concatenate the current string to the empty string
#
# Return the string

## Formal
# START
#
# Given an array of strings called "strings"
# SET result = ""
#
# SET count = 0
#
# WHILE count < strings.length
#   result += value at current count index in "strings"
# END
#
# PRINT result

# END

## Code

strings = ["This", "is", "a", "test"]

def concatenate(strings)
  result = ""
  strings.each {|string| result << string }
  return result
end

result = concatenate(strings)
puts result
