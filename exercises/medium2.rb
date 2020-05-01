# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
#characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.
def longest_sentence
  file = File.open("example_text_2.txt")
  file_data = file.read
  file_data = file_data.gsub("\n", " ")
  sentences = file_data.split(/[.!?]/)
  longest = sentences.max { |a,b| a.split.size <=> b.split.size }
  p longest
  p longest.split.size
end

# longest_sentence


# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.
# - for each char in word check if one of the block_strings contains the char
# - if true, delete block_strings from blocks and next
#   if false break and return false


def block_word?(word)
  blocks = ["BO", "XK", "DQ", "CP", "NA", "GT", "RE", "FS", "JW", "HU", "VI", "LY" , "ZM"]
  word.chars.each do |c|
    found = false
    blocks.each do |block_string|
      if block_string.downcase.include?(c.downcase)
        blocks.delete(block_string)
        found = true
      end
    end
    return false if found == false
  end
  true
end


# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true


# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
# You may assume that the string will always contain at least one character.

# My pseudo
# - instantiate a hash with the 3 options, all set to 0
# - split str into chars and loop through chars
#   - case statement for each char with 3 cases using regex match
#   - incement the correct element in the hash depending on which regex matches
# - convert numbers in hash into percentages

def letter_percentages(str)
  result = { :lowercase => 0, :uppercase => 0, :neither => 0 }
  chars = str.split('')
  chars.each do |char|
    case char
    when /[a-z]/ then result[:lowercase] += 1
    when /[A-Z]/ then result[:uppercase] += 1
    when /(?![a-zA-Z])/ then result[:neither] += 1
    end
  end
  result.each {|k, v| result[k] = (v.to_f / chars.size) * 100 }
end

# p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).

# Pseudo
# - extract parentheses from str into para_arr
# - check 1: equal number of open and closed ones?
# - check 2: check if first and last para is open and close

def test(search_symbols, symbol_arr)
  if symbol_arr.size >= 1
    return false if symbol_arr.count(search_symbols[0]) != symbol_arr.count(search_symbols[1])
    return false if !(symbol_arr[0] == search_symbols[0] && symbol_arr[-1] == search_symbols[1])
  end
  true
end

def balanced?(str)
  symbols = [['(', ')'], ['[', ']'], ['{', '}']]
  symbols.each do |symbol|
    arr = str.chars.select { |c| c == symbol[0] || c == symbol[1] }
    return false if test(symbol, arr) == false
  end
  true
end


# p balanced?("What (is)[] {this?") == false
# p balanced?('What is) {this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is []this))?') == true
# p balanced?('((Wh[at][)) (is this))?') == false
# p balanced?('Hey{}!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false



# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have lengths
# greater than 0: if either of these conditions is not satisfied, the triangle
# is invalid.
# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.
def valid_triangle?(triangle_arr)
  return false if triangle_arr.any? { |side| side == 0}
  sides_sorted = triangle_arr.sort
  return false if sides_sorted[0..1].sum < sides_sorted[2]
  true
end

def triangle_type(triangle_arr)
  if triangle_arr.uniq.size == 1 #all egual
    :equilateral
  elsif triangle_arr.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

def triangle(side1, side2, side3)
  triangle_arr = [side1, side2, side3]
  if valid_triangle?(triangle_arr)
    return triangle_type(triangle_arr)
  end
  :invalid
end


# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid


#Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
# is a right, acute, obtuse, or invalid triangle.
#You may assume integer valued angles so you don't have to worry about floating
#point errors. You may also assume that the arguments are specified in degrees.
def valid_triangle_angle?(triangle_arr)
  (triangle_arr.sum == 180 && !(triangle_arr.any? { |side| side == 0})) ? true : false
end

def triangle_type_angle(triangle_arr)
  if triangle_arr.include?(90)
    :right
  elsif triangle_arr.all? {|angle| angle < 90}
    :acute
  else
    :obtuse
  end
end

def triangle_angle(angle1, angle2, angle3)
  triangle_arr = [angle1, angle2, angle3]
  if valid_triangle_angle?(triangle_arr)
    return triangle_type_angle(triangle_arr)
  end
  :invalid
end

# p triangle_angle(60, 70, 50) == :acute
# p triangle_angle(30, 90, 60) == :right
# p triangle_angle(120, 50, 10) == :obtuse
# p triangle_angle(0, 90, 90) == :invalid
# p triangle_angle(50, 50, 50) == :invalid


require "Date"
require "Time"
# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752 (when the
# United Kingdom adopted the modern Gregorian Calendar) and that it will remain
# in use for the foreseeable future.
def friday_13th(year)
  count = 0
  thirteenth = Date.new(year,1,13)
  12.times do
    count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2



# A featured number (something unique to this exercise) is an odd number that
# is a multiple of 7, and whose digits occur exactly once each. So, for example,
# 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not
# a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Issue an error message
# if there is no next featured number.
def featured(num)
  num +=1
  loop do
    if num % 7 == 0 && (num.to_s.size == num.to_s.split("").uniq.size) && num.odd?
      return num
    end
    num += 1
  end
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
# p featured(9_999_999_999)


# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

# First try:
# def bubble_sort!(arr)
#   index = 0
#   no_swaps = 0
#   loop do
#     if arr[index] > arr[index + 1]
#       arr[index], arr[index + 1] = arr[index + 1], arr[index]
#     else
#       no_swaps +=1
#     end
#     index += 1
#     if index + 1 == arr.size
#       if no_swaps + 1 == arr.size
#         break
#       else
#         no_swaps = 0
#       end
#       index = 0
#     end
#   end
# end

# Second try:
def bubble_sort!(arr)
  loop do
    no_swaps, index = 0, 0
    loop do
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
      else
        no_swaps +=1
      end
      index +=1
      break if index + 1 == arr.size
    end
    break if no_swaps + 1 == arr.size
  end
end



# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.
def sum_square_difference(n)
  square_of_sum = ((1..n).sum)**2
  sum_of_squares = (1..n).reduce {|result, item| result + item**2}
  square_of_sum - sum_of_squares
end


p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
