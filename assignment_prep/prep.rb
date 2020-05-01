# Given the string of chars a..z A..Z do as in the sample cases

def accum(str)
  lower_str = str.downcase
  count = 1
  result = []
  lower_str.chars.each do |char|
    char_str = char.upcase + char * (count  - 1)
    result << char_str
    count +=1
  end
  result.join("-")
end

# p accum("abcd")    # "A-Bb-Ccc-Dddd"
# p accum("RqaEzty") # "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# p accum("cwAt")    # "C-Ww-Aaa-Tttt"





# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Pseudo
# - for each string get all possible substrings, put in array
# - check if there is an item that is equal between the two arrays
# - return true if that is the case, false otherwise

def substrings(str)
  substrings = []
  outer_count = 0
  loop do
    break if outer_count == str.size
    inner_count = outer_count
    loop do
      break if inner_count == str.size
      substrings << str[outer_count..inner_count]
      inner_count += 1
    end
    outer_count += 1
  end
  substrings
end

def substring_test(str1, str2)
  str1_substrings = substrings(str1.downcase)
  str2_substrings = substrings(str2.downcase)
  result =  str1_substrings & str2_substrings
  #p result.any? {|sub| sub.size > 1 }
  return true if result.any? {|word| word.size > 1 }
  false
end

p substring_test('Something', 'Fun') ==  false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
