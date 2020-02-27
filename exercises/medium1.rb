# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.
# Do not use the method Array#rotate or Array#rotate! for your implementation.
def rotate_array(arr)
   arr[1..-1] + [arr[0]]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Write a method that can rotate the last n digits of a number. For example:
def rotate_rightmost_digits(number, dig)
  number_digits = number.to_s.split('')
  return (number_digits[1..-1] + [number_digits[0]]).join.to_i if number_digits.size == dig
  front = number_digits[0..((number.size - dig) -3)]
  back = number_digits[(number.size - dig -2)..]
  back = back[1..-1] + [back[0]]
  result = front + back
  result.join.to_i
end

#solution
def rotate_rightmost_digits(number, n)
  number_digits = number.to_s.split('')
  number_digits[-n..-1] = rotate_array(number_digits[-n..-1])
  number_digits.join.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917


# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
#  Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits
# to get 321579. The resulting number is called the maximum rotation of the
# original number.
# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.
# Note that you do not have to handle multiple 0s.
def max_rotation(num)
  count = num.to_s.size
  loop do
    break if count == 0
    num = rotate_rightmost_digits(num, count)
    count -= 1
  end
  num
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845


# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches and toggle every one of them. You go back to the beginning, and on
# this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
# you go back again to the beginning and toggle switches 3, 6, 9, and so on.
#  You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


def switches(num_switches)
  on_switches = []
  num_switches.times.with_index do |i|
    (1..num_switches).each do |switch|
      switch_index = (i+1) * switch
      next if switch_index > num_switches
      on_switches.include?(switch_index) ? on_switches.delete(switch_index) : on_switches.push(switch_index)
    end
  end
  on_switches.sort
end

# p switches(1000)

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.
def build_arr(n, widest_row_index)
  stars = -1
  result = Array.new(n, 1)
  result.map.with_index do |item, index|
    if index <= widest_row_index
      stars += 2
    else
      stars -= 2
    end
  end
end

def diamond(n)
  widest_row_index = (n / 2)
  arr = build_arr(n , widest_row_index)
  arr.each do |num|
    puts "#{"*" * num}".center(n)
  end
end

# diamond(7)

#p build_arr(5,2)


# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

NUMBERS = {
  "one": "1",
  'two': '2',
  "three": "3",
  "four": '4',
  "five": '5',
  "six": "6",
  "seven": "7",
  "eight": "8",
  "nine": "9",
  "zero": "0",
}

def word_to_digit(words)
  NUMBERS.keys.each do |word|
    words.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  words
end
# We use the gsub! method to replace all instances of each number word.
# Here, we use a regex to look for a word in the string passed in and replace
# it with the corresponding digit. The word to look for is interpolated into the
# regex, /\b#{word}\b/. We use \b to limit the operation to complete words, not
# substrings. For instance, if the phrase/sentence passed into the method has
# the word "freight" in it, we won't replace it. If we don't use \b, we would
# convert "freight" to "fr8".

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
