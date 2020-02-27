# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument.
# The ASCII string value is the sum of the ASCII values of every character in
# the string. (You may use String#ord to determine the ASCII value of a character.)
def ascii_value(string)
  score = 0
  string.split("").each {|char|
    score += char.ord
  }
  score
end
#
# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0


# Write a method that takes a time using this minute-based (minutes before (-)
# or afer (+) midnight) format and returns the time of day in 24 hour format (hh:mm).
# Your method should work with any integer input.
def time_of_day(minutes)
  hours = (minutes / 60) % 24
  mins = minutes % 60
  format('%02d:%02d', hours, mins)
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"


# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively.
# Both methods should return a value in the range 0..1439.

def after_midnight(time)
  hours_minutes = time.split(":").map(&:to_i)
  minutes = (hours_minutes[0] * 60 + hours_minutes[1]) % 1440
end

def before_midnight(time)
  hours_minutes = time.split(":").map(&:to_i)
  minutes = (1440 - (hours_minutes[0] * 60 + hours_minutes[1])) % 1440
end


# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0



# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.
def swap(string)
  words = string.split(" ")
  result = words.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  result.join(" ")
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'



# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the non-alphabetic
# characters replaced by spaces. If one or more non-alphabetic characters occur
# in a row, you should only have one space in the result (the result should never
# have consecutive spaces).

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

#p cleanup("---what's my +*& line?") == ' what s my line '


# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
def word_sizes(string)
  result = Hash.new(0)
  arr = string.split(" ").map {|word| word.size}
  arr.each do |num|
    result[num] += 1
  end
  result
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}


# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.
def word_sizes_2(string)
  string_cleaned = string.gsub(/[^0-9a-z ]/i, '')
  word_sizes(string_cleaned)
end
#
# p word_sizes_2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes_2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes_2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes_2('') == {}


# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:
NUMBER_STRINGS = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
def alphabetic_number_sort(arr)
  strings = NUMBER_STRINGS[arr[0]..arr[-1]]
  strings.sort!
  result = strings.map {|str| NUMBER_STRINGS.index(str)}
end

def alphabetic_number_sort_2(arr)
  numbers.sort_by { |number| NUMBER_STRINGS[number] }
end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]


# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze
# or String#squeeze!.
def crunch(string)
  words = string.split(" ")
  crunched = words.map do |word|
    crunched_word = []
    word.split("").each {|c| crunched_word << c unless crunched_word.last == c}
    crunched_word.join
  end
  crunched.join(" ")
end

def crunch(string)
  string.chars.each_with_object('') do |char, new_string|
    new_string << char unless new_string[-1] == char
  end
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
