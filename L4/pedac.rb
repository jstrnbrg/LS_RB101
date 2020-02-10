# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: array containing all substrings that are palindromes contained in input
# rules:
  # explicit:
    # - case sensitive
    # - find palindrome substrings and add to new array
  # Implicit:
      # - return a new array


# - create an empty array called `result` that will contain all
#   the required substrings
# - initialize variable start_substring_idx and assign 0 to it.
# - initialize variable end_substring_idx and assign value of
#   start_substring_idx + 1 to it.
# - Enter loop which will break when start_substring_idx is equal
#     to str.size
#   - Within that loop enter another loop that will break if
#     end_substring_idx is equal to str.size
#     - append to the result array part of the string from
#       start_substring_idx to end_substring_idx
#     - increment `end_substring_idx` by 1.
#   - end the inner loop
#   - increment `start_substring_idx` by 1.
#   - reassign `end_substring_idx` to `start_substring_idx += 1`
# - end outer loop
# - return `result` array

def substrings(string)
  test_string = string
  result = []
  start_substring_idx = 0
  end_substring_idx = start_substring_idx + 1

  while start_substring_idx < test_string.size
    while end_substring_idx < test_string.size
      result << test_string[start_substring_idx..end_substring_idx]
      end_substring_idx += 1
    end
    start_substring_idx += 1
    end_substring_idx = start_substring_idx + 1
  end
  return result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(string)
  palindromes = []
  substring_array = substrings(string)
  substring_array.each do |substring|
    palindromes.push(substring) if is_palindrome?(substring)
  end
  return palindromes
end

puts palindrome_substrings("hallo")
