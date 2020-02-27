# Write a method that takes a floating point number that represents an angle between
#  0 and 360 degrees and returns a String that represents that angle in degrees,
#   minutes and seconds. You should use a degree symbol (°) to represent degrees,
#    a single quote (') to represent minutes, and a double quote (") to represent
#    seconds. A degree has 60 minutes, while a minute has 60 seconds.


def dms(float)
  degree = float % 360
  minutes = (((float % 1)*100) * 0.6)
  seconds = ((minutes % 1)*100) * 0.6
  format(%Q(%02d\xC2\xB0%02d'%02d),  degree, minutes, seconds)
end

# p dms(76.73)
# p dms(-420)


# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
def remove_vowels(arr)
  arr.map do |word|
    word.chars.select {|c|  !('AEIUOaeiuo'.include?(c))}.join
  end
end

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
#
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument.
def find_fibonacci_index_by_length(length)
  sequence = [1, 1]
  until sequence[-1].to_s.size == length do
    sequence << sequence[-1] + sequence[-2]
  end
  sequence.size
end


# p find_fibonacci_index_by_length(2) == 7
# p find_fibonacci_index_by_length(3) == 12
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847


# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.
def my_reverse(arr)
  copy = arr.dup
  arr.each_with_index {|v, i|
    arr[i] = copy[-i-1]
  }
end

list = %w(a b e d c)
result = my_reverse(list)
# p list
# p result
# p result.object_id
#p list.object_id

# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.
def my_reverse_2(arr)
  copy = arr.dup
  copy.each_with_index {|v, i|
    copy[i] = arr[-i-1]
  }
  copy
end

list = %w(a b e d c)
result = my_reverse_2(list)
# p list
# p result
# p result.object_id
# p list.object_id

# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the values from the argument Arrays.
# There should be no duplication of values in the returned Array, even if there
# are duplicates in the original Arrays.
def merge(arr1, arr2)
  arr1.each {|v| arr2 << v}
  arr2.uniq.sort
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of
# the original Array, respectively. If the original array contains an odd number
# of elements, the middle element should be placed in the first half Array.
def halvsies(arr)
  cut = (arr.size / 2.0).ceil - 1
  [arr[0..cut], arr[cut+1..]]
end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.
def find_dup(arr)
  sorted = arr.sort
  sorted.each_with_index {|v, i| return v if v == sorted[i-1]}
end

#p find_dup([1, 5, 3, 1]) == 1
#p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          # 38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          # 14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          # 78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          # 89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          # 41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          # 55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          # 85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          # 40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          # 7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73


# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.
def include?(arr, search)
  arr.each { |element| return true if search == element }
  false
end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.
def triangle(n)
  star_count = 1
  space_count = n - 1
  n.times do
    space = ' ' * space_count
    stars = '*' * star_count
    star_count += 1
    space_count -= 1
    puts "#{space}#{stars}"
  end
end

triangle(5)
