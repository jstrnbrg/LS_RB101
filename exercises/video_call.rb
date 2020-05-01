# A featured number (something unique to this exercise) is an odd number that is a
# multiple of 7, and whose digits occur exactly once each. So, for example, 49 is
# a featured number, but 98 is not (it is not odd), 97 is not (it is not a
# multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next
# featured number that is greater than the argument. Issue an error message if
# there is no next featured number.

# Pseudo
# - Definition Featured number: odd, multiple of 7 and each digits only once
# - Input int, output next bigger featured number or error

# - loop starting at integer
# - do the 3 checks
# - if they all return true then return current number
# - if not all true --> next
# - if num of digits is 11 break and return error

# Checks
# odd: odd?
# multiple of 7: int % 7 = 0
# digits only once: custom method


def digits_only_once(int)
  len = int.to_s.size # number of digits
  uniq_len = int.to_s.chars.uniq.size
  len == uniq_len
end

def featured(int)
  int += 1
  loop do
    break "Number to big" if int.to_s.size >= 11
    if int.odd? && int % 7 == 0 && digits_only_once(int)
      return int
    else
      int += 1
    end
  end
end


#Test Cases
# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

 p featured(9_999_999_999)
