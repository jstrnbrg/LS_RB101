# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the elements
# taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same
# number of elements.
def interleave(arr1, arr2)
  result = []
  arr1.each_with_index { |val, ind|
    result << val
    result << arr2[ind]
  }
  result
end

#p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']


# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.
UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a


def letter_case_count(input)
  result = {:lowercase => 0, :uppercase => 0, :neither => 0}
  input.chars.each do |c|
    if UPPERCASE_CHARS.include?(c)
      result[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(c)
      result[:lowercase] += 1
    else
      result[:neither] += 1
    end
  end
  result
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
#
# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character
# of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.
def word_cap(str)
  words = str.split(" ")
  result = words.map do |word|
    word[0] =~ /[A-Za-z]/ ? word.capitalize : word
  end
  result.join(" ")
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.
def swapcase(str)
  result = str.chars.map do |c|
    c =~ /[A-Z]/ ?  c.downcase :  c.upcase
  end
  result.join("")
end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.
def staggered_case(str, first: 0)
  result = str.chars.each_with_index.map do |val, ind|
    (ind + first) % 2 == 0 ? val.upcase : val.downcase
  end
  result.join
end

# p staggered_case('I Love Launch School!', first: 1) == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each letter.
# The non-alphabetic characters should still be included in the return value; they
# just don't count when toggling the desired case.
def staggered_case_2(str, first: true)
  up = first
  result = str.chars.map do |c|
    if c =~ /[^A-Za-z]/
      c
    else
      char = up == true ? c.upcase : c.downcase
      up = !up
      char
    end
  end
  result.join
end

# p staggered_case_2('I Love Launch School!', first: true) == 'I lOvE lAuNcH sChOoL!'


# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

def show_multiplicative_average(arr)
  result = arr.reduce(:*).to_f / arr.size
  puts "The result is #{'%.3f' % result}"
end

# show_multiplicative_average([3,5])
# show_multiplicative_average([2, 5, 7, 11, 13, 17])

# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each pair
# of numbers from the arguments that have the same index. You may assume that the
# arguments contain the same number of elements.
def multiply_list(arr1, arr2)
  arr1.each_with_index.map do |val, ind|
    val * arr2[ind]
  end
end

#p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]



# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.
def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |v1|
    arr2.each do |v2|
      result << v1 * v2
    end
  end
  result.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


#Write a method that returns the next to last word in the String passed to it
# as an argument. Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.
def penultimate(str)
  str.split[-2]
end
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
