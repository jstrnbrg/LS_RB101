# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the Array
# always contains at least one number.

def sum_of_sums(arr)
  sum = 0
  count = 0
  until count >= arr.size
    subarr = arr[0..count]
    sum += subarr.sum
    count += 1
  end
  sum
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.
# print 'Enter a noun: '
# noun = gets.chomp
#
# print 'Enter a verb: '
# verb = gets.chomp
#
# print 'Enter an adjective: '
# adjective = gets.chomp
#
# print 'Enter an adverb: '
# adverb = gets.chomp
#
# sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
# sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
# sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

# puts [sentence_1, sentence_2, sentence_3].sample


# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.
def substrings_at_start(str)
  count = -1
  str.chars.map do |_|
    count += 1
    str[0..count]
  end
end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

def substrings(str)
  result = []
  count = 0
  until count == str.size
    result << substrings_at_start(str[count..])
    count += 1
  end
  result.flatten
end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#  'b', 'bc', 'bcd', 'bcde',
#    'c', 'cd', 'cde',
#    'd', 'de',
#    'e'
#  ]

=begin
 Write a method that returns a list of all substrings of a string that are
 palindromic. That is, each substring must consist of the same sequence of
 characters forwards as it does backwards. The return value should be arranged
 in the same sequence as the substrings appear in the string. Duplicate
 palindromes should be included multiple times.
You may (and should) use the substrings method you wrote in the previous exercise.
For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
"Abc-bA" are. In addition, assume that single characters are not palindromes.
=end

# Thinking:
# 1. get all substrings
# 2. check which of these substrings are palindromes (excl single chars, case-sensitive)
def is_palindrome?(substring)
  substring.chars.each.with_index do |_, ind|
    if (substring[ind] == substring[-ind - 1]) == false
      return false
    end
  end
  true
end

def palindromes(str)
  substrings = substrings(str)
  substrings.select do |substring|
    is_palindrome?(substring) && substring.size != 1
  end
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".
def fizzbuz(from, to)
  result = []
  (from..to).each do |x|
    case
    when x % 3 == 0 && x % 5 == 0
      result << "FizzBuzz"
    when x % 3 == 0
      result << "Fizz"
    when x % 5 == 0
      result << "Buzz"
    else
      result << x
    end
  end
  result.join(', ')
end

#p fizzbuz(1,15)


# Write a method that takes a string, and returns a new string in which every
#character is doubled.
def repeater(str)
  result = ""
  str.chars.each do |c|
    result << c*2
  end
  result
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''


# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
def double_consonants(str)
  result = ''
  str.chars.each do |c|
    CONSONANTS.include?(c.downcase) ? result << repeater(c) : result << c
  end
  result
end

def double_consonants(str)
  str.chars.map { |c| c =~ /[b-df-hj-np-tv-z]/i ? c * 2 : c }.join
end


# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed. Examples:
def reversed_number(num)
  num.to_s.reverse.to_i
end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1


# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.
def center_of(str)
  middle = str.size / 2
  if str.size.odd?
    str[middle]
  else
    str[(middle - 1)..middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
