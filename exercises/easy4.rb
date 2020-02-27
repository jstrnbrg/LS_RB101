# Write a method that takes two strings as arguments, determines the longest
# of the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again.
# You may assume that the strings are of different lengths.

def short_long_short(str1, str2)
  long, short = str1.size > str2.size ? [str1, str2] : [str2, str1]
  short + long + short
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"


# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.
# New p centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.
def century(year)
  year_ceil = (year.to_f / 100).ceil
  if [11, 12, 13].include?(year_ceil % 100)
    result = year_ceil.to_s + "th"
  else
    last_digit = year_ceil.to_s[-1]
    ending = case last_digit
              when "1" then 'st'
              when "2" then 'nd'
              when "3" then 'rd'
              else 'th'
              end
      result = year_ceil.to_s + ending
  end
end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'



# In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.
# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not a leap year.

def leap_year?(year)
  if year % 400 == 0
    true
  elsif  year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true



# The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
# Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
# leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine
# leap years both before and after 1752.
def english_leap_year?(year)
  year > 1752 ? leap_year?(year) : year % 4 == 0
end

# p english_leap_year?(2016) == true
# p english_leap_year?(2015) == false
# p english_leap_year?(2100) == false
# p english_leap_year?(2400) == true
# p english_leap_year?(240000) == true
# p english_leap_year?(240001) == false
# p english_leap_year?(2000) == true
# p english_leap_year?(1900) == false
# p english_leap_year?(1752) == true
# p english_leap_year?(1700) == true
# p english_leap_year?(1) == false
# p english_leap_year?(100) == true
# p english_leap_year?(400) == true


# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples.
# For instance, if the supplied number is 20, the result
# should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# You may assume that the number passed in is an integer greater than 1.

def multisum(int)
  multiples_of_three_and_five = (1..int).select {|x| x % 3 == 0 || x % 5 == 0}
  multiples_of_three_and_five.sum
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the original
# Array.
def running_total(arr)
  count = 0
  result = arr.map {|x|
    count = x + count
  }
end

# Try solving this problem using Enumerable#each_with_object or
# Enumerable#inject (note that Enumerable methods can be applied to Arrays).
def running_total_2(arr)
  count = 0
  result = arr.each_with_object([]) {|value, result|
    count =  value + count
    result << count
  }
  result
end

#
# p running_total_2([2, 5, 13]) == [2, 7, 20]
# p running_total_2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total_2([3]) == [3]
# p running_total_2([]) == []





# Write a string to integer Conversion method without using any standard tandard
# conversion methods available in Ruby.
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = (10 * value) + digit }
  value
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570


# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number.
# If no sign is given, you should return a positive number.
def has_sign?(string)
  string[0] == "+" || string[0] == "-"
end

def string_to_signed_integer(string)
  if has_sign?(string)
    sign = string[0]
    digits = string[1..]
    number = string_to_integer(digits)
    return number - 2 * number if sign =="-"
    return number if sign == "+"
  else
    string_to_integer(string)
  end
end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.
def integer_to_string(int)
  arr = int.digits.reverse
  arr.map {|digit| (digit + 48).chr}.join
end

#p integer_to_string(+200)
# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# Extend the last method to deal with signed integers
def signed_integer_to_string(integer)
  if integer > 0
    "+" + integer_to_string(integer)
  elsif integer < 0
    "-" + integer_to_string(integer.abs)
  else
    "0"  
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
